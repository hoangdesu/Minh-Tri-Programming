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

conn = sqlite3.connect("todos.db")
conn.row_factory = sqlite3.Row

cur = conn.cursor()
res = cur.execute("SELECT * FROM todos")

todos = res.fetchall()

for row in todos:
    print(dict(row))

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
    return todos


@app.post('/todos')
async def add_new_todo(todo_input: Annotated[str, Form()]):
    print('got a new todo', todo_input)
    todos.append(todo_input)
    return RedirectResponse(url="http://127.0.0.1:5500/", status_code=status.HTTP_303_SEE_OTHER)


class Todo(BaseModel):
    todo: str

@app.delete('/todos')
def delete_todo(todo_obj: Todo):
    print('deleting...', todo_obj)
    
    todo_content = todo_obj.todo
    print(todo_content)

    if todo_content in todos:
        todos.remove(todo_content)
    
    return RedirectResponse(url="http://127.0.0.1:5500/", status_code=status.HTTP_303_SEE_OTHER)

    