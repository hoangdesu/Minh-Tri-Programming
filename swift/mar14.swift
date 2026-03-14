// var s = "hello"

// print(s[s.index(s.startIndex, offsetBy: 1)])

// print(Array(s)[2])

// print(String(Array(s)[0]) == "h")

func extract_attributes(tag: String) -> [String:Double] {
    let elements = tag.split(separator: " ")
    // print(elements)

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

let tag = #"<trkpt lat="10.7734670" lon="106.7260430">"#

print(extract_attributes(tag: tag))

for (key, val) in extract_attributes(tag: tag) {
    print("\(key): \(val)")
}


// // trkpt: {
// //     lat: 10.7734670,
// //     106.7260430,
// //     ele
// //     time
// // }

// [
//     lat: 10.7734670,
//     lon: 106.7260430,
// ]





