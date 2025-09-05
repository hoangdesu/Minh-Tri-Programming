# Function call stack
# Once a var or a func is defined, it will be PUSHED onto the stack
# Stackoverflow
# Recursive: đệ quy - a function calling itself

# Iteration vs Recursion

# def hi(name):
#     print('hi ' + name)
#     hi('Trí')

    
# hi('Trí')

# def count(num):
#     print(num)
#     count(num + 1)
    
# count(1)

# counter = 0
# while True:
#     print(counter)
#     counter += 1
    
    
# 1 int = 4 byte = 2.1B

# global a
# a = 1
# b_num = 2



# def a():
#     print('calling function a')
#     # done
    
# def b():
#     print('calling function a')
#     a()

# def c():
#     print('calling function c')
#     b()
    
# c()

# print(b_num)


# for i in range(1, 10+1):
#     print(i)

# Recursive function

# def count(start, stop):
#     # Base case:
#     if start > stop:
#         return
    
#     print(start)
#     count(start + 1, stop)
    
# count(1, 10)


# Prime number:
    
    
def is_prime(num: int) -> bool:
    ...


# is_prime(1) -> False

# is_prime(0) -> False

# is_prime(2) -> True
# is_prime(19) -> True

# num / 0

# print(10 / 0)


def recursive_is_prime(num: int, counter = 2) -> bool:
    if num == 2: 
        return True
    if num % counter == 0 or num < 2:
        return False
    
    recursive_is_prime(num, counter + 1)
    return True

# False
print(recursive_is_prime(0))
print(recursive_is_prime(1))
print(recursive_is_prime(8))

# True
print(recursive_is_prime(2))
print(recursive_is_prime(7))
print(recursive_is_prime(19))
