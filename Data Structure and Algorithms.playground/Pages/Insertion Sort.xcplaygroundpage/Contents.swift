/*:
[Previous](@previous)
****
# Insertion Sort
*/
import Foundation

var array = randomArray(40, maxNumber: 100)

var iterations = 0
var visualisation = 0

for (index, number) in array.enumerate() {
    for i in 0...index {
        ++iterations
        if array[i] > array[index] {
            let removedValue = array[index]
            array.removeAtIndex(index)
            array.insert(removedValue, atIndex: i)
            break
        }
    }
    visualize("Iteration\(visualisation++)", array: array)
}
//: [Next](@next)
