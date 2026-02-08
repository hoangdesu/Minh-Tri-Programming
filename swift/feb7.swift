func charFrequency(_ word: String) -> [Character:Int] {
    var wordFreq = Dictionary<Character, Int>()

    for char in word.lowercased() {
        // - In Swift, accessing a value from a dictionary using a key returns an "optional" because the key might not exist
        // - Using Safe Unwrap: if let || guard let
        if let currentCount = wordFreq[char] {
            wordFreq[char] = currentCount + 1;
        } else {
            wordFreq[char] = 1
        }
    }

    return wordFreq
}

// omit the argument label "word" with underscore 
let wordFrequency = charFrequency("abcAd") // ignore case

print(wordFrequency)
// -> [
//     "a": 2,
//     "b": 1,
//     "c": 1,
//     "d": 1
// ]

// iterator -> array -> string


// var cities = [
//     "vietnam": "hanoi",
//     "japan": "tokyo",
//     "korea": "busan"
// ]

// cities["korea"] = "seoul"

// print(cities)


func wordFrequency(_ sentence: String) -> [String : Int] {
    var freq: [String:Int] = [:]

    // - In Swift, the split(separator:) method on a String returns an array of Substring (which is the type alias for String.SubSequence), not an array of String. This design choice is for performance, as a Substring points to the original string's memory, avoiding unnecessary copying until explicitly converted. 
    // - If you need a standard [String] array (e.g., for use with APIs that require String objects), you can use the map(String.init) method to convert each subsequence to a new String instance. 

    for word in sentence.split(separator: " ").map(String.init) {
        if let count = freq[word] {
            freq[word] = count + 1
        } else {
            freq[word] = 1
        }
    }

    return freq
}

print(wordFrequency("i love swift and i am learning swift"))

// [
//     "i": 2,
//     "love": 1,
//     "swift": 2,
//     ...
// ]


// Exercise: Valid Parentheses

// "{[()]}" -> valid
// }{ -> invalid
// {}([]) -> valid
// {}([)] -> invalid

// Use a Stack to keep track of the parens


func validParentheses(parens: String) -> Bool {
    //
    
    return false
}
