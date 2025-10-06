const conversations = [
  {
    role: 'user',
    content: 'wassup :D',
  },
  {
    role: 'bot',
    content: 'heyy!!',
  },
  {
    role: 'user',
    content: 'hows the weather today',
  },
  {
    role: 'bot',
    content: 'pretty goooooddd',
  },
];

const convo2 = [
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

  div.textContent = convo.content;

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
      content: chatInput.value,
    };

    conversations.push(userChat);

    console.log(conversations);

    // also update the UI
    const div = document.createElement('div');
    div.className = 'user-box';
    div.textContent = userChat.content;
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

    const content = {
      contents: [{ parts: [{ text: userChat.content }] }],
    };

    const newUserConvo2 = {
      role: 'user',
      parts: [
        {
          text: userChat.content,
        },
      ],
    };

    convo2.push(newUserConvo2);

    const div2 = document.createElement('div');
    div2.className = 'bot-box loader';
    // div2.textContent = '';
    chatBox.append(div2);

    // Fetch API
    fetch(END_POINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': API_KEY,
      },
      // body: JSON.stringify(content)
      body: JSON.stringify({
        contents: convo2,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        const botReponse = data.candidates[0].content.parts[0].text;
        const botRes = {
          role: 'model',
          parts: [
            {
              text: botReponse,
            },
          ],
        };

        convo2.push(botRes);

        // mimicking the response back from server
        const botChat = {
          role: 'bot',
          content: botReponse,
        };

        conversations.push(botChat);

        div2.className = 'bot-box';
        div2.textContent = botChat.content;
      });

    // reset chat input
    chatInput.value = '';
  }
});
