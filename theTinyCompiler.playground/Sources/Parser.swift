import Foundation

public struct Parser {
    public init() {}
    
    public func parse(_ tokens: [Token]) -> AST {
        assert(!tokens.isEmpty, "Tokens should not be empty")
        var currentIndex = 0
        
        func walk() -> ASTNode {
            var token = tokens[currentIndex]
            
            if token.type == "number" {
                currentIndex += 1
                return ASTNode(type: "NumberLiteral", name: token.value)
            }
            
            if token.type == "string" {
                currentIndex += 1
                return ASTNode(type: "StringLiteral", name: token.value)
            }
            
            if token.type == "paren" && token.value == "(" {
                currentIndex += 1
                token = tokens[currentIndex]
                var node = ASTNode(type: "CallExpression", name: token.value, parameters: [])
                
                currentIndex += 1
                token = tokens[currentIndex]
                
                while (token.type != "paren" || (token.type == "paren" && token.value != ")")) {
                    node.parameters.append(walk())
                    token = tokens[currentIndex]
                }
                currentIndex += 1
                return node
            }
            
            fatalError("Unrecognized token type: \(token.type)")
        }
        
        var ast = AST(type: "Program", body: [])
        
        while (currentIndex < tokens.count) {
            ast.body.append(walk())
        }
        
        return ast
    }
}

public struct ASTNode {
    let type: String
    let name: String
    var parameters: [ASTNode]
    
    public init(type: String, name: String, parameters: [ASTNode] = []) {
        self.type = type
        self.name = name
        self.parameters = parameters
    }
}

public struct AST {
    let type: String
    var body: [ASTNode]
}
