/*:
[Previous](@previous)
****
# Selection Sort
*/
import Foundation

var array = randomArray(40, maxNumber: 100)

var iterations = 0
var visualisation = 0

for index in array.indices {
    var lowest = Int.max
    var lowestIndex = 0
    
    for i in index..<array.count {
        iterations++
        if array[i] < lowest {
            lowest = array[i]
            lowestIndex = i
        }
    }
    swap(&array[index], &array[lowestIndex])
    visualize("Iteration\(visualisation++)", array: array)
}
//: [Next](@next)
