import requests

ENDPOINT = 'https://valorant-api.com/v1/agents/'
res = requests.get(ENDPOINT)

print(res)

if res.ok:
    # print(res.content)
    agents = res.json().get('data')
    # print(data[7]['displayName'])
    
    # agent_name = input('Enter agent name: ')
    
    # Linear search
    for i in range(len(agents)):
        agent = agents[i]
        
        # if agent_name == agent.get()
        name = agent.get('displayName')
        uuid = agent.get('uuid')
        
        abilities = agent.get('abilities')

        
        print(f'{i+1}. {name}: {uuid}')
        
        for ab in abilities:
            ab_name = ab.get('displayName')
            print(f'\t- {ab_name}')
            
    agent_name = input('\nEnter agent name: ')
    
    for agent in agents:
        name = agent.get('displayName')
        if agent_name.lower() == name.lower():
            abilities = agent.get('abilities')

        
            print(f'Found {name}:')
            
            for ab in abilities:
                ab_name = ab.get('displayName')
                print(f'\t- {ab_name}')
            
            