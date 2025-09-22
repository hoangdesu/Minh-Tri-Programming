import json

with open('outputs.json') as f:
    videos = json.loads(f.read())
    
    # for video in videos:
    #     print(video)
        
    sorted_videos = sorted(videos, key=lambda k: k['views'], reverse=True)

    for video in sorted_videos:
        print(video['title'], video['views'])
        
        
    
    