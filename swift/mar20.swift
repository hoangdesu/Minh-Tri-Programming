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

import Foundation

func extract_value(element: String) -> [String: String]? {
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

func extract_attributes(tag: String) -> [String:Double]? {
    let elements = tag.split(separator: " ")
    // print(elements)
    if elements.count == 0 { return nil }

    var attributes: [String:Double] = [:]

    // loop from 1, skip the first el
    for el in elements[1...] {
        // print(el)
        let pairs = el.split(separator: "=")
        // print("pairs:", pairs)

        let key = String(pairs[0])
        var val = String(pairs[1])

        if val.contains(">") {
            val = val.replacing(">", with: "")
        }

        attributes[key] = Double(val.replacing("\"", with: ""))
    }

    return attributes
}

func parse_gpx_file(filename: String) {

    let fileUrl = URL(fileURLWithPath: filename)

    // try-catch: do-catch
    var fileContent = ""
    do {
        fileContent = try String(contentsOf: fileUrl, encoding: .utf8)
        // print("File content:", fileContent)
    } catch {
        print("Error reading file:", error.localizedDescription)
    }

    // var datapoint: String = []
    let lines = fileContent.split(separator: "\n")
    for line in lines {
        // print(extractValue(element: String(line)))
        // print(extract_value(element: String(line)))
        // print(extract_attributes(tag: String(line)))


        // if line satisfies the format -> parse line

        if extract_value(element: String(line)) != nil {
            print(extract_value(element: String(line))!["ele"])
        }
    }


    // return [:]
}

parse_gpx_file(filename: "./run-data/run1.gpx")
