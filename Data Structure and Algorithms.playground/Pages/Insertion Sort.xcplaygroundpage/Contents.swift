/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Insertion Sort
*/
import UIKit

var array = randomArray(200, maxNumber: 1000)

var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
arrayView.values = array
arrayView.captureView("View")

for (index, number) in array.enumerate() {
    for i in 0...index {
        if array[i] > array[index] {
            let removedValue = array[index]
            array.removeAtIndex(index)
            array.insert(removedValue, atIndex: i)
            break
        }
    }
    arrayView.values = array
    arrayView.captureView("View")
}