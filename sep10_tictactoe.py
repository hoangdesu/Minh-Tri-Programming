# 3 x 3

# GUI vs CLI

# # 2D list

# board:
#     1 2 3
#     4 5 6
#     7 8 9
    
    
#     1 | 2 | 3
#     --+---+--
#     4 | 5 | 6
#     --+---+--
#     7 | 8 | 9


#     +---+---+---+
#     | 1 | 2 | 3 |
#     +---+---+---+
#     | 4 | 5 | 6 |
#     +---+---+---+
#     | 7 | 8 | 9 |
#     +---+---+---+


# valid moves: 1-9    

# X move: 5

#     1 | 2 | 3
#     --+---+--
#     4 | X | 6
#     --+---+--
#     7 | 8 | 9

# O move: 5
# 5 is not available

# O move: 10
# 10 is not a valid move

# O move: 4

#     1 | 2 | 3
#     --+---+--
#     O | X | 6
#     --+---+--
#     7 | 8 | 9

# X move: 3

#     1 | 2 | X
#     --+---+--
#     O | X | 6
#     --+---+--
#     7 | 8 | 9

# O move: 8

#     1 | 2 | 3
#     --+---+--
#     O | X | 6
#     --+---+--
#     7 | O | 9

# X move: 7

#     1 | 2 | X
#     --+---+--
#     O | X | 6
#     --+---+--
#     X | O | 9
    
# X wins!

# X: 1
# O: 0


def print_board(board: list[list[str | int]]) -> None:
    print('\n+---+---+---+')
    for row in board:
        print("| ", end="")
        for element in row:
            print(element, end=" | ")
        print('\n+---+---+---+')
    
# hard code
board = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# board = []
# TODO: populate the list

# print(board)
# print_board(board)

# to_string()

# board[1][2] => 6

# board[1].pop(1)

board[1][2] = 'X'

print_board(board)


