import requests


with open('videos.csv', 'r') as file:
    video_ids = []
    
    # skip the header row
    file.readline()
    
    for i in range(10):
        line = file.readline()
        columns = line.split(',')
        video_ids.append(columns[0])
        
    print(video_ids)
    
    YT_BASE_URL = 'https://www.youtube.com/watch?v='
    
    for video_id in video_ids:
        res = requests.get(YT_BASE_URL + video_id)
        
        if res.ok:
            content = str(res.content)
            search_query = '<title>'
            start_index = content.find(search_query)
            start_index += len(search_query)
            end_index = content.find('- YouTube')

            # print(start_index, end_index)
            
            title = content[start_index:end_index]
            title = title.replace('&#39;', "’")
            print(title)    

    
# TODO: extract data from csv file, convert and write to JSON file