# Linear search:
    
#     [a, b, c, d]

books = ['atomic habits', 'elon musk', 'godfather']

# print(books[-1]) reversed index

def linear_search(lst: list, item: str) -> int:
    count = 0
    for i in range(len(lst)):
        count += 1
        if item == lst[i]:
            print('linear search count:', count)
            return i
    return None

print(linear_search(books, 'elon musk'))
print(linear_search(books, 'how to win friends'))



# Binary search
nums = []
for i in range(1, 101):
    nums.append(i)
    
print(nums)
    
    
def binary_search(nums: list, item: int) -> bool:
    head_ptr = 0
    tail_ptr = len(nums) - 1
    count = 0

    while head_ptr <= tail_ptr:
        count += 1
        mid_ptr = (head_ptr + tail_ptr) // 2
        mid_value = nums[mid_ptr]
        
        if mid_value > item:
            tail_ptr = mid_ptr - 1
        elif mid_value < item:
            head_ptr = mid_ptr + 1
        elif mid_value == item:
            print('binary search count:', count)
            return True
    
    print('binary search count:', count)
    return False
        
        
print(linear_search(nums, 75))
print(binary_search(nums, 75))

print(binary_search(nums, 101))


# Swapping values
a = 1
b = 2

# //  swap
temp = 0


# print(a, b) 2, 1


Homework:
    param: an array of integers e.g [1,2,3,4,5,6,7,8,9,10]
    return: another array of elements randomly shuffle e.g. [1,3,2,9,7,10,8,5,6,4]

def shuffle(lst: list) -> list:
    ...

import random


print(random.randint(1, 10))

shuffle(nums)


