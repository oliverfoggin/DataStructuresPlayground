/*:
****
# Bubble sort
*/
import Foundation

var array = randomArray(20, maxNumber: 100)

var iterations = 0
var visualisation = 0

for _ in array.indices {
    for i in 0..<array.count {
        if i+1 < array.count && array[i] > array[i+1] {
            swap(&array[i], &array[i+1])
            visualize("Iteration\(visualisation++)", array: array)
        }
    }
}
//: [Next](@next)
