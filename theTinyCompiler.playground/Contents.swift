import Foundation

let tokenizer = Tokenizer()
let parser = Parser()

let code = "(add 123 (divide 4 2))"
let tokens = tokenizer.tokenize(code)
print(tokens)
let ast = parser.parse(tokens)
print(ast)
