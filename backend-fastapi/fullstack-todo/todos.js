const todosContainer = document.querySelector('#todos-container');

const SERVER_ENDPOINT = 'http://127.0.0.1:8000';

// Initial load
fetch(`${SERVER_ENDPOINT}/todos`)
    .then(res => res.json())
    .then(todos => {
        todos.forEach(todo => {
            console.log(todo);
            
            const li = document.createElement('li');
            li.textContent = todo.content;

            const btn = document.createElement('button');
            btn.textContent = '❌';
            btn.className = 'delete-btn';

            btn.addEventListener('click', () => {
                console.log('click on', todo);

                fetch(`${SERVER_ENDPOINT}/todos`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ todo_id: todo.id })
                })
                    .then(res => {
                        console.log(res);
                        // window.location.reload();
                    })
                    // .then()
                    // .then()
                    // .catch()
                
            });

            
        

            li.appendChild(btn);

            const editBtn = document.createElement('button');
            editBtn.textContent = '✏️';
            editBtn.className = 'edit-btn';
            li.append(editBtn);

            todosContainer.append(li);
        });


    })
    .catch(err => {
        console.log('Error getting all TODOS:', err); 
    });


// ASCII

// a = 97 => hex 

// 01010101 1100101010
