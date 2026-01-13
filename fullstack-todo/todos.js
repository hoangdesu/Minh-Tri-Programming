const todosContainer = document.querySelector('#todos-container');

const SERVER_ENDPOINT = 'http://127.0.0.1:8000';

const deleteHandler = (todoId) => {
    fetch(`${SERVER_ENDPOINT}/todos`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ todo_id: todoId })
    })
        .then(res => {
            console.log(res);
            window.location.reload();
        })
}

const displayAlert = (content) => {
    alert(`clicked on ${content}`);
};

function checkboxChangeHandler(event) {
    console.log(event.target.getAttribute('data-todo-id'), event.target.checked);
    const todoId = event.target.getAttribute('data-todo-id');
    
    fetch(`${SERVER_ENDPOINT}/todos/update-status`, {
        method: 'PUT', // patch is also OK
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ 
            todo_id: todoId,
            new_completed_status: event.target.checked
         })
    })
        .then(res => res.json())
        .then(data => {
            console.log(data);
        });
}

const renderTodo = (todo) => {
    const template = `
        <tr>
            <td>${todo.id}</td>
            <td class="todo-content-box">
                ${todo.content}
            </td>
            <td style="text-align: center;">
                <input type="checkbox" ${todo.completed && "checked"} data-todo-id=${todo.id} 
                onchange="checkboxChangeHandler(event)"
                >
            </td>
            <td>${todo.created_at}</td>
            <td>
                <button class="edit-btn">✏️</button>
                <button onclick="deleteHandler(${todo.id})">🗑️</button>
            </td>
        </tr>
    `;

    // const parser = new DOMParser();
    // const doc = parser.parseFromString(template, 'text/html');

    // const checkbox = doc.querySelector('input[type="checkbox"]');
    // checkbox.addEventListener('change', (evt) => {
    //     console.log(evt.target.value);
    // });


    // const parser = new DOMParser();
    // const doc = parser.parseFromString(template, 'text/html');

    // const tr = doc.querySelector('tr');
    // const editBtn = tr.querySelector('.edit-btn');
    // const todoContentBox = tr.querySelector('.todo-content-box');
    
    // editBtn.addEventListener('click', () => {
    //     console.log('editing...', todo.content);
        
    //     todoContentBox.innerHTML = `<input type="text" value="${todo.content}" />`;
    // });
    
    // console.log(editBtn);

    // return document.adoptNode(tr);
    return template;
};

function onButtonClicked(btnType) {
    alert(btnType);
}

fetch(`${SERVER_ENDPOINT}/todos`)
    .then(res => res.json())
    .then(todos => {
        todos.forEach(todo => {
            const newTodoRow = renderTodo(todo);
            // todosContainer.appendChild(newTodoRow);
            todosContainer.innerHTML += newTodoRow;
        });
    });
