/*:
****
# Alternating bubble sort
*/
import UIKit

var array = randomArray(10, maxNumber: 1000)

var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
arrayView.values = array
arrayView.captureView("View")

for _ in 0..<Int(array.count / 2) {
    for i in 0..<array.count - 1 {
        if array[i] > array[i+1] {
            swap(&array[i], &array[i+1])
        }
    }
    arrayView.values = array
    arrayView.captureView("View")
    
    for i in stride(from: array.count - 1, through: 1, by: -1) {
        if array[i] < array[i-1] {
            swap(&array[i], &array[i-1])
        }
    }
    arrayView.values = array
    arrayView.captureView("View")
}
//: [Next](@next)
