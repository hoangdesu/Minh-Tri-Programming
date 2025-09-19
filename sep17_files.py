# users.json

# [
#     {
#         'username': '1',
#         'password': ''
#     },
#     {
#         'username': '2',
#         'password': ''
#     }
# ]


import json

USER_DATA_FILE = 'users.json'

def sign_up(username: str, password: str) -> bool:
    # my_file = open(USER_DATA_FILE)
    # ...
    # my_file.close()

    users = []
    
    # step 1: open file to read current data
    with open(USER_DATA_FILE, 'r') as users_file:
        content = users_file.read()
        
        # print(content)
        
        # load content as string, convert to data structures that python can understand
        users = list(json.loads(content))
        
        # print(users[1].get('password'))
        
        # no need, file is automatically close using "with open()"
        # users_file.close()
        
        # Username validation
        for user in users:
            if user.get('username') == username:
                print('Error: username exists. Cannot create new user')
                return False
                

    
    # step 2: append new user object to current user list
    with open(USER_DATA_FILE, 'w') as users_file:
        new_user = {
            'username': username,
            'password': password,
            'alias': ['a', 'b', 'c']
        }
        
        # not so clean :/
        # users_file.write(str(new_user).replace('\'', '"'))
        
        # convert python dict to JSON string
        # users_file.write(json.dumps(new_user, indent=2))
        

        # add new user to list of current user
        users.append(new_user)
        
        users_file.write(json.dumps(users, indent=4))
        
    return True
        

def sign_in(username: str, password: str) -> bool:
    users_file = open(USER_DATA_FILE, 'r')
    
    content = users_file.read()
    
    users = json.loads(content)
    
    for user in users:
        if user.get('username') == username:
            if user.get('password') == password:
                users_file.close()
                return True
    
    
    # need to manually close file at the end
    users_file.close()
    return False
                



# sign_up('tri', 'secret')
# sign_up('123', '456')

uname = input('Enter username: ')
pwd = input('Enter password: ')

if sign_in(uname, pwd):
    print('Login successfully!')
else:
    print('Login failed...')
        


# Pre-req: need to be signed in to remove user
def remove_user(username: str) -> bool:
    ...
    
    