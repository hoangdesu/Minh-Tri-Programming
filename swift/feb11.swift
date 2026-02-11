// Exercise: Valid Parentheses

// "{[()]}" -> valid
// }{ -> invalid
// {}([]) -> valid
// {}([)] -> invalid

// Use a Stack to keep track of the parens


func validParentheses(parens: String) -> Bool {
    // var stack: [Character] = []
    // var stack = Array<Character>()
    var stack = [Character]()

    let pairs = [
        // key:val
        "}": "{",
        "]": "[",
        ")": "("
    ]

    for char in parens {
        // print(String(char))
        // '(' => "("
        // if let closeBracket = pairs[String(char)] {
        //     print("close bracket:", closeBracket, char)
        // }

        if char == "(" || char == "{" || char == "[" {
            stack.append(char)
        } else if char == ")" || char == "}" || char == "]" {
            if char != stack.last {
                return false
            }
            var lastChar = stack.popLast()
        }

        print(stack)

    }
    
    return false
}

// print(validParentheses(parens: "{[()]}"))

// fileContent: string

// if let openBracket = opposite[String(char)] {
//     -> value = openBracket
// }


// Read file content
import Foundation

let fileUrl = URL(fileURLWithPath: "./feb7.swift")

// try-catch: do-catch
var fileContent = ""
do {
    fileContent = try String(contentsOf: fileUrl, encoding: .utf8)
    print("File content:", fileContent)
} catch {
    print("Error reading file:", error.localizedDescription)
}

validParentheses(fileContent)
