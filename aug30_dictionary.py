# Dictionary: Data structure using pairs of key-value
# - key must be unique
# - values can be duplicated
# => achieve the lookup time of O(1) - constant
# - hash table, hash map


capitals = {
    'vietnam': 'hue',
    'thailand': 'bangkok',
    'singapore': 'singapore',
    'netherland': 'amsterdam',
    # 'vietnam': 'hanoi'
}

# Direct access
capitals['vietnam'] = 'Hà Nội'
capitals['china'] = 'beijing'

print(capitals['vietnam'])
# print(capitals['korea']) # dangerous -> make sure key exists before accessing

print(capitals.get('japan')) # None
print(capitals.get('netherland'))


print(capitals)

# Iterable: an object that you can perform loops on

for key in capitals:
    print(f'key = {key}, value = {capitals[key]}')
    

for key, value in capitals.items():
    print(f'{key}: {value}')
    
print('removed: ', capitals.pop('thailand'))


for val in capitals.values():
    print(val)
    
    

brian = {
    'name': {
        'first': 'Brian',
        'last': 'Nguyen'
    },
    'birthyear': 1995,
    'hobbies': ['music', 'coding', 'gaming', 'sports'],
    'pet_owner': False
}


if 'name' in brian:
    if 'last' in brian['name']:
        print(brian['name']['last'])
        


def has_duplicate(lst: list) -> bool:
    seen = {}
    
    for val in lst:
        if val in seen:
            return True
        else:
            # create a new pair in the dictionary
            seen[val] = 1

        # try:
        #     seen[val]
        #     return True
        # except:
        #     seen[val] = 1

    return False



print(has_duplicate([1, 2, 3, 4, 5, 6, 7, 2])) # -> True
print(has_duplicate([1, 2, 3, 4, 5, 6, 7])) # -> False


# list: O(n^2)
# dictionary: O(n)

# has_duplicate2


def char_frequency(s: str) -> dict:
    ...


print(char_frequency('abcadac'))

# {
#     'a': 3,
#     'b': 1,
#     'c': 2,
#     'd': 1
# }


HW:
def word_frequency(text: str) -> dict:
    ...
    

HW: O(n)
def twoSum(nums: list[int], target: int) -> list[int]:
    ...
    
    
[2,7,11,15], target = 22
-> [1, 3] (7,15)


a + b = total
b = total - a

accumulator
    