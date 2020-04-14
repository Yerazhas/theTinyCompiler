import Foundation

public struct Token {
    let type: String
    let value: String
    
    public init(type: String, value: String) {
        self.type = type
        self.value = value
    }
}
