import Foundation

// MARK: - String Extension -


func tokenize(_ input: String) -> [Token] {
    var currentIndex = 0
    var tokens = [Token]()
    
    func preincGet() -> String {
        currentIndex += 1
        return input[currentIndex]
    }
    // MARK: -  Utility methods -

    while currentIndex < input.count {
        var char = input[currentIndex]

        if char == "(" {
            tokens.append(Token(type: "paren", value: "("))
            currentIndex += 1
            continue
        }

        if char == ")" {
            tokens.append(Token(type: "paren", value: ")"))
            currentIndex += 1
            continue
        }

        let whitespace = " "
        if char == whitespace {
            currentIndex += 1
            continue
        }

        let numbers = ("0"..."9")
        if numbers.contains(String(char)) {
            var value = ""
            while(numbers.contains(String(char))) {
                value += String(char)
                currentIndex += 1
                char = input[currentIndex]
            }
            tokens.append(Token(type: "number", value: value))
            continue
        }
        
        if char == "\"" {
            var value = ""
            currentIndex += 1
            char = input[currentIndex]
            
            while char != "\"" {
                value += char
                char = preincGet()
            }
            char = preincGet()
            tokens.append(Token(type: "string", value: value))
            continue
        }
        
        if char.isLetter() {
            var value = ""
            
            while(char.isLetter()) {
                value += char
                char = preincGet()
            }
            
            tokens.append(Token(type: "name", value: value))
            continue
        }
        
        fatalError("Unrecognized char \(char)")
    }
    
    return tokens
}

let code = "(add 123 456)"
print(tokenize(code))
