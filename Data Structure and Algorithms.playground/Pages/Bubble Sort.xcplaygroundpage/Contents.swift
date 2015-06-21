/*:
****
# Bubble sort
*/
import UIKit

var array = randomArray(20, maxNumber: 100)

var iterations = 0
var visualisation = 0

if #available(iOS 9, *) {
    var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
    arrayView.values = array
    arrayView.captureView("View")
    arrayView
}

for _ in array.indices {
    for i in 0..<array.count - 1 {
        iterations++
        if array[i] > array[i+1] {
            swap(&array[i], &array[i+1])
        }
    }
//    visualize("Iteration\(visualisation++)", array: array)
}

array
//: [Next](@next)
