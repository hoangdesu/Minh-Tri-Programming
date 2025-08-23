

# [(1, ) 2, 4, 5, 3]
# [(1, 2), 4, 5, 3]
# [(1, 2, 3), 5, 4]

# Selection sort
 
 
def selection_sort(lst: list[int]) -> list[int]:
    nums = lst.copy()
    compares = 0
    
    for i in range(len(nums) - 1):
        smallest_num = nums[i]
        smallest_index = i
        
        # look for index of the smallest value
        for j in range(i+1, len(nums)):
            print(f'i={nums[i]}, j={nums[j]}')
            if nums[j] < smallest_num:
                smallest_index = j
                smallest_num = nums[smallest_index]
                
        # print(f'smallest_index={smallest_index} - smallest_num={smallest_num}')
        
        # swap the 2 values
        temp = nums[i]
        nums[i] = nums[smallest_index]
        nums[smallest_index] = temp

        compares += 1
                
        print(nums)
    print('selection sort:', compares)
    return nums
            
       
nums = [2, 1, 4, 5, 3]     
print(selection_sort(nums))

print('after sorted:', nums)

# Bubble sort
# [2, 1, 4, 5, 3]
# [1, 2, 4, 5, 3]
# [1, 2, 4, 5, 3]
# [1, 2, 4, 5, 3]
# [1, 2, 4, 3, 5]
# [1, 2, 3, 4, 5]


def bubble_sort(lst: list[int]) -> list[int]:
    nums = lst.copy()
    compares = 0
    for i in range(len(nums) - 1):
        for j in range(i+1, len(nums)):
            if nums[i] > nums[j]:
                temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                compares += 1
    print('bubble sort:', compares)
    return nums

print(bubble_sort([2, 1, 4, 5, 3]))


# Primitive: pass by value
def add_1(a):
    a = a + 1
    print('a inside: ', a)
    
a = 1

add_1(a)

print('a outside: ', a)


HW:
    while + list
        
    Enter a number: 2
    Enter a number: 4
    Enter a number: 1
    Enter a number: 5
    Enter a number: 0
    
    2 + 4 + 1 + 5 = 12
    