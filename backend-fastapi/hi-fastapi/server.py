from typing import Union, List, Dict

from fastapi import FastAPI, status, Request
from fastapi.responses import HTMLResponse, JSONResponse
from pydantic import BaseModel
import time
from functools import wraps

app = FastAPI()


games = ['bouldering', 'csgo', 'chess']


# Middlewares
@app.middleware("http")
async def print_request(request: Request, call_next):
    print('> Middleware 1: Received a request!')
    response = await call_next(request)
    return response


@app.middleware("http")
async def add_process_time_header(request: Request, call_next):
    print('> Middleware 2: Process time!')
    start_time = time.perf_counter()
    response = await call_next(request)
    process_time = time.perf_counter() - start_time
    response.headers["my-custom-header-for-timer"] = str(process_time)
    return response


def single_route_middleware_decorator(func):
    @wraps(func)
    async def wrapper(request: Request, *args, **kwargs):
        print('> Middleware 3: Single route middleware')
        start_time = time.time()
        print(f"Decorator before route for {request.url}")
        response = await func(request, *args, **kwargs)
        process_time = time.time() - start_time
        print(f"Decorator after route for {request.url}. Processed in {process_time:.5f} seconds")
        return response
    return wrapper

# Route handler
@app.get("/")
@single_route_middleware_decorator
async def read_root(request: Request):
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


# return schema: using {
#   "additionalProp1": {}
# } by default

class ReturnTypeAdd(BaseModel):
    total: int

# /add/a/b
@app.get('/add/{a}/{b}', summary="Takes in 2 integers and return their total")
def add(a: int, b: int) -> ReturnTypeAdd:
    return {"total": a + b}


@app.get('/games')
def get_games() -> List[str]:
    return games


@app.get('/games/{index}')
def get_game(req: Request, index: int):
    return games[index] if index < len(games) else "index error"



# POST
class Game(BaseModel):
    name: str
    
    
def required_login(func):
    @wraps(func)
    async def wrapper(request: Request, *args, **kwargs):
        print('> Middleware 4: Require logged in to protect routes')
        print('headers:', request.headers)
        
        if request.headers.get('secret-token') != 'hehe':
            return JSONResponse(
                status_code=status.HTTP_400_BAD_REQUEST,
                content={"message": "Unauthenticated"}
            )
        
        response = await func(request, *args, **kwargs)
        return response
    return wrapper


@app.post('/games', status_code=status.HTTP_201_CREATED)
@required_login
async def add_game(request: Request, new_game: Game):

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


    