from typing import Union, List

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
def get_games() -> List[str]:
    return games


@app.get('/games/{index}')
def get_game(index: int):
    return games[index] if id < len(games) else "index error"



# POST
class Game(BaseModel):
    name: str


@app.post('/games', status_code=status.HTTP_201_CREATED)
def add_game(new_game: Game):

    # Guarding
    if new_game.name in games:
        return JSONResponse(
            status_code=status.HTTP_400_BAD_REQUEST,
            content={"message": "Duplicated game"}
        )
        
    games.append(new_game.name)
    return games



# games.pop()


# PUT
# PUT /games
# body -> {
#     current index to be changed: int,
#     new data to update: str
# }

# PUT /games/{index}
# body -> {
#     new data to update: str
# }


# DELETE 