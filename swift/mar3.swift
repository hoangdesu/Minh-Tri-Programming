// 1. Read gpx run data file
// 2. Build a dictionary: similar to JSON

// let run_data = [
//     "time": "2026-02-07T00:05:57Z",
//     "name": "Morning Run",
//     "type": "running",
//     // list of dictionaries
//     "trkseg": [
//         [
//             "time": "2026-02-07T00:05:57Z"
//             "lat": 10.7734670,
//             "lon": 106.7260430,
//             "ele": 3.9
//         ],
//         [
//             "time": "2026-02-07T00:05:57Z"
//             "lat": 10.7734670,
//             "lon": 106.7260430,
//             "ele": 3.9
//         ],
//         ...
//     ]
// ]

// func parse_gpx_file(filename: String) -> Dictionary

// parse_gpx_file(filename: "./run-data/run1.gpx")


// helper functions to extract values and attributes from an element
// func extract_value("<time>2026-02-07T00:05:57Z</time>")
// -> "time": "2026-02-07T00:05:57Z"

// // optional
// func extract_attributes("<trkpt lat="10.7734670" lon="106.7260430">")
// -> [
//     lat: 10.7734670,
//     lon: 106.7260430
// ]


// Markdown: text + simple stylings

func extract_value(element: String) {
    var i = 0

    var key = ""
    var val = ""

    // for char in element {
    //     print(char)
    //     if char == "<" {

    //     }
    // }

    while i < element.count {
        let index = element.index(element.startIndex, offsetBy: i)
        if String(element[index]) == "<" {
            
            i += 1 // shift right 1 position

            while String(element[index]) != ">" {
                key += String(element[index])
                i += 1
            }
        }

        i += 1
    }

    print("key:", key) // "time"
    
}
                    //  i
                    //  012345->
extract_value(element: "<time>2026-02-07T00:05:57Z</time>")
// => time: "2026-02-07T00:05:57Z"

