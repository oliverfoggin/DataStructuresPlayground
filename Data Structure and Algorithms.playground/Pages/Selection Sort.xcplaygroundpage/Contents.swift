/*:
[Previous](@previous)
****
# Selection Sort
*/
import UIKit

var array = randomArray(100, maxNumber: 100)

var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
arrayView.values = array
arrayView.captureView("View")

for index in array.indices {
    var lowest = Int.max
    var lowestIndex = 0
    
    for i in index..<array.count {
        if array[i] < lowest {
            lowest = array[i]
            lowestIndex = i
        }
    }
    swap(&array[index], &array[lowestIndex])
    arrayView.values = array
    arrayView.captureView("View")
}
//: [Next](@next)
