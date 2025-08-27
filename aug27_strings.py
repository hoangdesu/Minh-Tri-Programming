# https://cs50.harvard.edu/x/psets/1/credit/

from typing import Literal

def check_card_valid(card: str) -> bool:
    ...

def get_card_type(card: str) -> Literal['AMEX', 'MASTERCARD', 'VISA', 'INVALID']:
    if check_card_valid(card):
        TODO: check which type the card belongs to


# print('a' + 1)

# numbers = [1,2,3]
# number_strs = map(str, numbers)
# # print(number_strs)
# for n in number_strs:
#     print(type(n))
# # => new_numbers = ['1', '2', '3']


for i in range(10, -1, -2):
    print(i)