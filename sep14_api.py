import requests
import sys

ENDPOINT = 'https://valorant-api.com/v1/agents/'
res = requests.get(ENDPOINT)

if not res.ok:
    print('Request error')
    sys.exit()


# Request OK
agents = res.json().get('data')

print(f"All agents ({len(agents)}):")

# Linear search
for i in range(len(agents)):
    agent = agents[i]
    
    name = agent.get('displayName')
    uuid = agent.get('uuid')
    
    abilities = agent.get('abilities')

    print(f'{i+1}. {name}')
        
role_query = input('\nGet agents by role: ')

for agent in agents:
    role = agent.get('role').get('displayName')
    if role_query.lower() == role.lower():
        name = agent.get('displayName')

        print(f'- {name}')
        
            
# HW: use the movie API https://imdbapi.dev/
