def find_even(lst: list[int]) -> list[int]:
    evens = []
    for num in lst:
        if num % 2 == 0:
            evens.append(num)
    return evens

nums = [1, 2, 3, 4, 5]
# evens = find_even(nums) # [2, 4]

# print(evens)

def find(num_type: str, nums: list[int]) -> list[int]:
    ...    

find('odd', nums)
find('even', nums)

# numType, findEvenNumbersInAList



def print_triangle(height: int):
    for line in range(1, height+1):
        for char in range(line):
            print('*', end="")
        print()


print_triangle(5)

# *
# **
# ***
# ****
# *****


# print(1, end="")
# print(2)

def print_right_triangle(height: int):
    spaces = height - 1 # counter
    for line in range(1, height+1):
        for s in range(spaces):
            print(' ', end='')
        for c in range(line):
            print('*', end='')
        print()
        spaces -= 1
        
    
print_right_triangle(7)

#     *
#    **
#   ***
#  ****
# *****




# for i in range(10, 5-1, -1):
#     print(i)

# print('o' * 4)


# "    *"


Homework:

def print_pyramid(height: int)

print_pyramid(7)


#       *
#      ***
#     *****
#    *******
#   *********
#  ***********
# *************


def print_diamond(height: int)

print_diamond(5)

#       *
#      ***
#     *****
#      ***
#       *