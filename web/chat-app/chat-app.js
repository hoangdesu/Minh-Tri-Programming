const conversations = [
    {
        role: 'user',
        content: 'wassup :D'
    },
    {
        role: 'bot',
        content: 'heyy!!'
    },
    {
        role: 'user',
        content: 'hows the weather today'
    },
    {
        role: 'bot',
        content: 'pretty goooooddd'
    }
];

console.log('hello from chat-app.js');

const chatBox = document.querySelector('#chat-box');

// initial render
conversations.forEach(convo => {
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
            content: chatInput.value
        }

        conversations.push(userChat);

        console.log(conversations);
        
        // also update the UI
        const div = document.createElement('div');
        div.className = 'user-box';
        div.textContent = userChat.content;
        chatBox.append(div);

        // TODO: get real response from LLM
        
        // mimicking the response back from server
        const botChat = {
            role: 'bot',
            content: 'Wassup!!!'
        }

        conversations.push(botChat);

        const div2 = document.createElement('div');
        div2.className = 'bot-box loader';
        // div2.textContent = '';
        chatBox.append(div2);

        // simulate loading chat
        setTimeout(() => {
            div2.className = 'bot-box';
            div2.textContent = botChat.content;
        }, 1000);




        // reset chat input
        chatInput.value = '';

    }
    
});
