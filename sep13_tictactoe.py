from typing import Literal

def check_win(board: list[list[str | int]]) -> None | Literal['x', 'o']:
    winner = None
    
    # check rows
    for i in range(len(board)):
        ref = board[i][0]
        for j in range(1, len(board[i])):
            if board[i][j] != ref:
                break
            winner = ref

    # check cols
    for i in range(len(board)):
        ref = board[i][0]
        for j in range(1, len(board[i])):
            if board[j][i] != ref:
                break
            winner = ref

    return winner
    
# board = [
#     [1, 2, 3],
#     ['x', 'x', 'x'],
#     [7, 8, 9]
# ]

# print(check_win(board))


# board = [
#     [1, 2, 3],
#     [4, 5, 6],
#     ['o', 'o', 'o'],
# ]

# print(check_win(board))

# board = [
#     ['x', 2, 3],
#     ['x', 5, 6],
#     ['x', 'o', 'o'],
# ]

# print(check_win(board))

board = [
    [1, 2, 3],
    [4, 5 ,6],
    [7, 8, 9]
]


player = 'x'

while True:
    move = int(input(f'{player} move: '))
    
    # replace move:
    for i in range(len(board)):
        for j in range(len(board[i])):
            if move == board[i][j]:
                board[i][j] = player
                
    
    if player == 'x':
        player = 'o'
    else:
        player = 'x'
        
    # print(board)
    for row in board:
        for el in row:
            print(el, end=" ")
        print()
    print()
                
    print('winner:', check_win(board))