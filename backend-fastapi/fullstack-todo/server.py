from fastapi import FastAPI, Form, status
from fastapi.responses import RedirectResponse, HTMLResponse
from fastapi.middleware.cors import CORSMiddleware
from typing import Annotated
# from fastapi.templating import Jinja2Templates

app = FastAPI()

todos = ['Install UV', 'Learn FastAPI', 'Install database']

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
    return todos


@app.post('/todos')
async def add_new_todo(todo_input: Annotated[str, Form()]):
    print('got a new todo', todo_input)
    todos.append(todo_input)
    return RedirectResponse(url="http://127.0.0.1:5500/", status_code=status.HTTP_303_SEE_OTHER)


# TODO: implement the delete function
