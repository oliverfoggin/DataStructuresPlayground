/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Binary Tree
*/
import XCPlayground

let array = randomArray(50, maxNumber: 1000)

let tree = BinaryTree(value: array[0])
Array(array[1..<array.count]).map{tree.add($0)}

XCPCaptureValue("Tree", value: tree)
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
