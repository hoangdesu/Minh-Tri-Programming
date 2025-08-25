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

Palindrome

def is_palindrome(text: str) -> bool:

Two-pointers

is_palindrome('RadAr') -> True
