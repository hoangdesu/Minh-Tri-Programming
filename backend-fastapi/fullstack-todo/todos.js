const todosContainer = document.querySelector('#todos-container');

const SERVER_ENDPOINT = 'http://127.0.0.1:8000';

// Initial load -> building list element li's (old)

/*
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

*/


// ASCII

// a = 97 => hex 

// 01010101 1100101010

// Global handlers that take in params
function onEditButtonClicked(todo) {
    console.log('> Editing ', todo.content);
}

const deleteHandler = (todo) => {
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
}

const renderTodo = (todo) => {
    // '': single quote
    // "": double quotes
    // ``: string template literal
    
    // Notes: The problem was that onEditButtonClicked and deleteHandler were defined inside renderTodo, 
    // so they weren't accessible to the onclick attributes (which look for functions in the global scope).
    // function onEditButtonClicked() {
    //     console.log('Clicked on', todo.content);
    // }

    // const deleteHandler = () => {
    //     fetch(`${SERVER_ENDPOINT}/todos`, {
    //         method: 'DELETE',
    //         headers: {
    //             'Content-Type': 'application/json'
    //         },
    //         body: JSON.stringify({ todo_id: todo.id })
    //     })
    //         .then(res => {
    //             console.log(res);
    //             // window.location.reload();
    //         })
    // }


    return `
        <tr>
            <td>${todo.id}</td>
            <td>${todo.content}</td>
            <td style="text-align: center;">
                <input type="checkbox" ${todo.completed && "checked"}>
            </td>
            <td>${todo.created_at}</td>
            <td>
                <button onclick="onEditButtonClicked(${todo})">✏️</button>
                <button onclick="deleteHandler(${todo})">🗑️</button>
            </td>
        </tr>
    `;
};

// Problem notes: 
//     - passing the entire todo object directly into the onclick handler. When an object is interpolated into a string, it becomes [object Object], which isn't valid JavaScript and causes a syntax error.    
//     - <button onclick="onEditButtonClicked(${todo})">✏️</button> => becomes <button onclick="onEditButtonClicked([object Object])">✏️</button>

// Not good when multiple elements wanna evoke the same function, only changing the params
// const likeBtn = document.querySelector('#like-btn');
// likeBtn.addEventListener('click', () => {
//     alert('Liked 👍');
// });

// const subscribeBtn = document.querySelector('#subscribe-btn');
// subscribeBtn.addEventListener('click', () => {
//     alert('Liked 👍');
// });

function onButtonClicked(btnType) {
    alert(btnType);
}


// Initial load: new approach -> building table rows using string template literal
fetch(`${SERVER_ENDPOINT}/todos`)
    .then(res => res.json())
    .then(todos => {
        todos.forEach(todo => {
            const newTodoRow = renderTodo(todo); // -> str: represents the HTML template
            todosContainer.innerHTML += newTodoRow;
        });
    });

