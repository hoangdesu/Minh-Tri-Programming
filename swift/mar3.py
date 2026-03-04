def extract_value(element):
    i = 0
    key = ''
    val = ''
    
    while i < len(element) - 1:
        # build the key
        if element[i] == '<':
            i += 1
            while element[i] != '>':
                key += element[i]
                i += 1

        # build the val
        else:
            i += 1
            while element[i] != '<':
                val += element[i]
                i += 1
            else:
                # print(key, val)
                return {
                    key: val,
                }
        

print(extract_value("<time>2026-02-07T00:05:57Z</time>"))
# {'time': '2026-02-07T00:05:57Z'}