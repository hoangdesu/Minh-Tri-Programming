const todosContainer = document.querySelector('#todos-container');

const SERVER_ENDPOINT = 'http://127.0.0.1:8000';

// Initial load
fetch(`${SERVER_ENDPOINT}/todos`)
    .then(res => res.json())
    .then(todos => {
        todos.forEach(todo => {
            const li = document.createElement('li');
            li.textContent = todo;

            // TODO: implement the delete function
            const btn = document.createElement('button');
            btn.textContent = '❌';
            li.appendChild(btn);

            todosContainer.append(li);
        });
    })
    .catch(err => {
        console.log('Error getting all TODOS:', err); 
    });