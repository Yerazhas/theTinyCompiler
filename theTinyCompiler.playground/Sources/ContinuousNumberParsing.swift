import Foundation

func parsingContinuousNumberInString() {
    let string = "123 jfjf 12345"

    func tokenize() {
        var currentIndex = 0 {
            didSet {
                print("current Index set to: \(currentIndex)")
            }
        }
        while currentIndex<string.count {
            var char = string[currentIndex]

            let numbers = ("0"..."9")
            if numbers.contains(char) {
                print("contained number char \(char)")
                var value = ""
                while(numbers.contains(String(char))) {
                    value += String(char)
                    currentIndex += 1
                    char = string[currentIndex]
                }
                print(value)
            }
            currentIndex += 1
        }
    }
    tokenize()
}
