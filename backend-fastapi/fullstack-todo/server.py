from fastapi import FastAPI, Form, status
from fastapi.responses import RedirectResponse, HTMLResponse
from fastapi.middleware.cors import CORSMiddleware
from typing import Annotated
from pydantic import BaseModel
# from fastapi.templating import Jinja2Templates

import sqlite3

app = FastAPI()

# todos = ['Install UV', 'Learn FastAPI', 'Install database']

# Switch over to using data from SQLite3
# check_same_thread: prevents file-locking

conn = sqlite3.connect("todos.db", check_same_thread=False)
conn.row_factory = sqlite3.Row

    
# conn.close()


origins = [
    "http://localhost",
    "http://localhost:5500",
    'http://127.0.0.1:5500'
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# templates = Jinja2Templates(directory="templates")
    
    
@app.get("/")
async def root():
    return {"message": "TODOs app"}


@app.get('/todos')
def get_todos():
    print('getting all todos')
    
    # --- Approach 1: create separate connection to db on every call
    # conn = sqlite3.connect("todos.db")
    # conn.row_factory = sqlite3.Row

    # cur = conn.cursor()
    
    # res = cur.execute("SELECT * FROM todos")

    # todos = res.fetchall()

    # for row in todos:
    #     print(dict(row))
        
    # conn.close()

    # --- Approach 2: re-use connection
    cur = conn.cursor()

    res = cur.execute("SELECT * FROM todos")

    todos = res.fetchall()

    for row in todos:
        print(dict(row))

    # optional, good practice
    cur.close()
    
    return todos


@app.post('/todos')
async def add_new_todo(todo_input: Annotated[str, Form()]):
    print('got a new todo', todo_input)
    # todos.append(todo_input)
    
    cur = conn.cursor()

    cur.execute("""
        INSERT INTO todos (content) 
        VALUES (?)
    """, (todo_input,))


    # Note: don't use f-string to prevent SQL-injection

    # save final changes to db
    conn.commit()
    
    cur.close()
    
    return RedirectResponse(url="http://127.0.0.1:5500/", status_code=status.HTTP_303_SEE_OTHER)


class Todo(BaseModel):
    todo_id: int

@app.delete('/todos')
def delete_todo(todo: Todo):
    print('deleting...', todo)
    
    # todo_content = todo_obj.todo
    # print(todo_content)

    # if todo_content in todos:
    #     todos.remove(todo_content)

    cur = conn.cursor()

    cur.execute("""
        DELETE FROM todos
        WHERE id = ?
    """, (todo.todo_id,))

    conn.commit()
    
    cur.close()
    
    return RedirectResponse(url="http://127.0.0.1:5500/", status_code=status.HTTP_303_SEE_OTHER)

    

# .get login:
    
#     username password
    
#     SELECT uname, pwd 
#     FROM users
#     WHERE username = uname AND password = pwd;
    
#     'OR 1 = 1'

    