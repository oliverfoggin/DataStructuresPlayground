/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Bubble sort
*/
import UIKit

var array = randomArray(200, maxNumber: 1000)

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
