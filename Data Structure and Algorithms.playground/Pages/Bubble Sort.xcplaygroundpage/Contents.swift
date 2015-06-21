/*:
****
# Bubble sort
*/
import Foundation
import XCPlayground

var array = randomArray(40, maxNumber: 100)

var iterations = 0
var visualisation = 0

for _ in array.indices {
    for i in 0..<array.count - 1 {
        iterations++
        if array[i] > array[i+1] {
            swap(&array[i], &array[i+1])
        }
    }
    visualize("Iteration\(visualisation++)", array: array)
}
//: [Next](@next)
