# String = immutable

# name = 'tri'

# name[0] = 'T'

# print(name)

# name = ['t', 'r', 'i']

# name[0] = 'T'

# print(name)

# key = 'bun thit nuong'
# description = 'mon an noi tieng o sai gon'

# TODO: parse key, remove unwanted chars
# parsed_key = 'bunthitnuong'

# => [] len = 12
# answer = ['b', '_', '_', 't', '_', '_', 't', '_', '_', '_', '_', '_', ]

# lst = ['a', 'b', 'c']

# name = "".join(lst)
# print(name)

# str1 == str2

# if true:
    
# else:

word_database = [
    {
        'answer': 'SUNI Ha Linh',
        'description': '1 nữ ca sĩ'
    },
    {
        'answer': 'Son Tung MTP',
        'description': 'Hoàng tử nhạc Việt'
    },
    {
        'answer': '52Hz',
        'description': 'A Vietnamese female singer',
    },
]

import random

# single import
from random import randint

random_index = randint(0, len(word_database) - 1)

random_entry = word_database[random_index]

print(f"answer: {random_entry['answer']} - description: {random_entry['description']}")




