const converter = new showdown.Converter();
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
const chatInput = document.querySelector('#chat-input');

// Configuration
const API_KEY = 'AIzaSyCBOHnRHRSlJbaqF98PKJ8MN3GAbewbImQ';
const SSE_ENDPOINT = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:streamGenerateContent?alt=sse&key=${API_KEY}`;

// Initial render
function renderMessage(convo) {
  const div = document.createElement('div');
  div.className = convo.role === 'user' ? 'user-box' : 'bot-box';
  
  if (convo.role === 'model') {
    div.innerHTML = converter.makeHtml(convo.parts[0].text);
  } else {
    div.textContent = convo.parts[0].text;
  }
  
  chatBox.append(div);
  return div;
}

conversations.forEach(renderMessage);

// Scroll to bottom helper
function scrollToBottom() {
  chatBox.scrollTo({
    top: chatBox.scrollHeight,
    behavior: 'smooth',
  });
}

// Stream response from Gemini API
async function streamResponse(userMessage) {
  const userChat = {
    role: 'user',
    parts: [{ text: userMessage }],
  };
  
  conversations.push(userChat);
  
  // Add user message to UI
  const userDiv = document.createElement('div');
  userDiv.className = 'user-box';

  const userTextSpan = document.createElement('span');
  userTextSpan.textContent = userMessage;
  userDiv.append(userTextSpan);
  chatBox.append(userDiv);
  
  // Create bot response container
  const botDiv = document.createElement('div');
  botDiv.className = 'bot-box loader';
  chatBox.append(botDiv);
  scrollToBottom();
  
  // Disable input
  chatInput.value = '';
  chatInput.disabled = true;
  
  try {
    const response = await fetch(SSE_ENDPOINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        contents: conversations,
      }),
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    const reader = response.body.getReader();
    const decoder = new TextDecoder();
    let accumulatedText = '';
    
    botDiv.className = 'bot-box';
    
    while (true) {
      const { done, value } = await reader.read();
      
      if (done) break;
      
      const chunk = decoder.decode(value, { stream: true });
      const lines = chunk.split('\n');
      
      for (const line of lines) {
        if (line.startsWith('data: ')) {
          const jsonStr = line.slice(6);
          
          if (jsonStr.trim() === '') continue;
          
          try {
            const data = JSON.parse(jsonStr);
            
            if (data.candidates && data.candidates[0]?.content?.parts?.[0]?.text) {
              const textChunk = data.candidates[0].content.parts[0].text;
              accumulatedText += textChunk;
              
              // Update UI with streamed content
              botDiv.innerHTML = converter.makeHtml(accumulatedText);
              scrollToBottom();
            }
          } catch (e) {
            console.error('Error parsing SSE data:', e);
          }
        }
      }
    }
    
    // Save complete response to conversations
    const botRes = {
      role: 'model',
      parts: [{ text: accumulatedText }],
    };
    conversations.push(botRes);
    
  } catch (error) {
    console.error('Error streaming response:', error);
    botDiv.className = 'bot-box';
    botDiv.textContent = 'Error: Unable to get response. Please try again.';
  } finally {
    chatInput.disabled = false;
    chatInput.focus();
  }
}

// Event listener for chat input
chatInput.addEventListener('keypress', (evt) => {
  if (evt.key === 'Enter' && chatInput.value.trim()) {
    streamResponse(chatInput.value.trim());
  }
});