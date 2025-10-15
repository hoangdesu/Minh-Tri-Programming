const converter = new showdown.Converter();

// text      = '# hello, markdown!',
// html      = converter.makeHtml(text);

const conversations = [
  {
    role: 'user',
    parts: [
      {
        text: 'Hello my name is Brian',
      },
    ],
  },
  {
    role: 'model',
    parts: [
      {
        text: 'Great to meet you. What would you like to know?',
      },
    ],
  },
];

console.log('hello from chat-app.js');

const chatBox = document.querySelector('#chat-box');

// initial render
conversations.forEach((convo) => {
  const div = document.createElement('div');
  if (convo.role === 'user') {
    div.className = 'user-box';
  } else {
    div.className = 'bot-box';
  }

  div.textContent = convo.parts[0].text;

  chatBox.append(div);
});

const chatInput = document.querySelector('#chat-input');

chatInput.addEventListener('keypress', (evt) => {
  // console.log(evt.target.value);

  if (evt.key === 'Enter') {
    // guard
    if (!chatInput.value) return;

    console.log('chat', chatInput.value);

    const userChat = {
      role: 'user',
      parts: [
        {
          text: chatInput.value,
        },
      ],
    };

    conversations.push(userChat);

    console.log(conversations);

    // also update the UI
    const div = document.createElement('div');
    div.className = 'user-box';
    const userTextSpan = document.createElement('span');
    userTextSpan.textContent = chatInput.value;
    div.append(userTextSpan);
    chatBox.append(div);

    // TODO: get real response from LLM

    // curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent" \  ✔
    //       -H "x-goog-api-key: AIzaSyCBOHnRHRSlJbaqF98PKJ8MN3GAbewbImQ" \
    //       -H 'Content-Type: application/json' \
    //       -X POST \
    //       -d '{ "contents": [ { "parts": [ { "text": "Explain how AI works in a few words" } ] } ] }'

    const END_POINT =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent';
    const API_KEY = 'AIzaSyCBOHnRHRSlJbaqF98PKJ8MN3GAbewbImQ';

    const div2 = document.createElement('div');
    div2.className = 'bot-box loader';
    // div2.textContent = '';
    chatBox.append(div2);

    // Fetch API
    // Asynchronous: bất đồng bộ

    // reset chat input
    chatInput.value = '';
    chatInput.disabled = true;

    chatBox.scrollTo({
      top: chatBox.scrollHeight,
      behavior: 'smooth',
    });

    fetch(END_POINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': API_KEY,
      },
      // body: JSON.stringify(content)
      body: JSON.stringify({
        contents: conversations,
      }),
    })
      // ...loading...
      .then((res) => res.json())
      .then((data) => {
        const botRes = {
          role: 'model',
          parts: [
            {
              text: data.candidates[0].content.parts[0].text,
            },
          ],
        };

        conversations.push(botRes);

        div2.className = 'bot-box';
        div2.innerHTML = converter.makeHtml(
          data.candidates[0].content.parts[0].text
        );

        chatInput.disabled = false;

        chatBox.scrollTo({
          top: chatBox.scrollHeight,
          behavior: 'smooth',
        });
      });
  }
});

// Refactor: clean up + optimize
