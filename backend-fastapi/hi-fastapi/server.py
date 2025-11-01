from typing import Union

from fastapi import FastAPI, status
from fastapi.responses import HTMLResponse, JSONResponse
from pydantic import BaseModel

app = FastAPI()


games = ['bouldering', 'csgo', 'chess']



# Route handler
@app.get("/")
def read_root():
    return {"Hello": "World"}




@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    if item_id < len(games):
        return {"game": games[item_id], "q": q}
    else:
        return {"message": "error"}
    
    

@app.get('/hi', response_class=HTMLResponse)
def hi_page():
    name = 'Tri'
    return f"<h1>hello {name}</h1>"


# /add/a/b
@app.get('/add/{a}/{b}')
def add(a: int, b: int):
    
    return {"total": a + b}



@app.get('/games')
def get_games():
    return games


@app.get('/games/{id}')
def get_game(id: int):
    return games[id] if id < len(games) else "id error"



# POST
class Game(BaseModel):
    name: str


@app.post('/games', status_code=status.HTTP_201_CREATED)
def add_game(new_game: Game):

    if new_game.name not in games:
        games.append(new_game.name)
        return games

    
    return JSONResponse(
            status_code=status.HTTP_400_BAD_REQUEST,
            content={"message": "Duplicated game"}
        )
