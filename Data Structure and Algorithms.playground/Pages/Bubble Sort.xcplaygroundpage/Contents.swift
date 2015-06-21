/*:
****
# Bubble sort
*/
import UIKit

var array = randomArray(100, maxNumber: 100)

var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
arrayView.values = array
arrayView.captureView("View")

for _ in array.indices {
    for i in 0..<array.count - 1 {
        if array[i] > array[i+1] {
            swap(&array[i], &array[i+1])
        }
    }
    arrayView.values = array
    arrayView.captureView("View")
}
//: [Next](@next)
