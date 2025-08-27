# String = list of characters

name = "Minh Tri aka\t\"Tit\""
print(name)

# Escape character \
    
# \n
# \t
# \"
# \'

print("\\^o^/")

# ASCII

print("🤣" * 10)

# Convert between ascii code
print(ord('a'))
print(chr(66))


password = 'this is a secret'
key = 8

# Encryption

for i in range(len(password)):
    print(password[i])


for char in password:
    print(char)
    


def encrypt(plain_text: str, key: int) -> str:
    cipher = ''
    for c in plain_text:
        encrypted_ascii = ord(c) + key
        
        # wrap around
        if encrypted_ascii > 122:
            encrypted_ascii -= 26

        if c != ' ':
            cipher += chr(encrypted_ascii)
        else:
            cipher += c
    return cipher
            
    
cipher = encrypt(password, 8)
print(f'cipher = {cipher}')

    
def decrypt(cipher: str, key: int) -> str:
    ...


def bruteforce(cipher: str) -> list[str]:
    ...
    
['1', '2']

# Palindrome

# Two-pointers

# is_palindrome('RadAr') -> True

#   i
#   j
# RadAr


# n/2 + n/2 + n + n
# => n / 2

# str1 == str2 

# 'abc' == 'abc'

# str1[0] == str2[0]
# str1[1] == str2[1]
# str1[2] == str2[2]

def is_palindrome(text: str) -> bool:
    head = 0
    tail = len(text) - 1
    
    # while head <= tail
    
    for _ in range(len(text) // 2):
        if text[head].lower() != text[tail].lower():
            return False
        head += 1
        tail -= 1
        
    return True

print(is_palindrome('rAdAr'))
print(is_palindrome('abBa'))
print(is_palindrome('radxat'))
