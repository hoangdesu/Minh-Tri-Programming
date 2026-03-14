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

// optional
// func extract_attributes("<trkpt lat="10.7734670" lon="106.7260430">")
// -> [lat: 10.7734670, lon: 106.7260430]

/// Extracts tag name and content from an XML-style element string.
/// Returns [key: value] or nil if parsing fails.
func extractValue(element: String) -> [String: String]? {
    guard let openBracket = element.firstIndex(of: "<"),
          let closeBracket = element.firstIndex(of: ">"),
          closeBracket > openBracket else { return nil }

    let key = String(element[element.index(after: openBracket)..<closeBracket])

    let valueStart = element.index(after: closeBracket)
    guard valueStart < element.endIndex,
          let nextOpen = element[valueStart...].firstIndex(of: "<") else { return nil }

    let value = String(element[valueStart..<nextOpen])

    return [key: value]
}

// Example
if let result = extractValue(element: "<time>2026-02-07T00:05:57Z</time>") {
    print(result)
}
// => ["time": "2026-02-07T00:05:57Z"]

