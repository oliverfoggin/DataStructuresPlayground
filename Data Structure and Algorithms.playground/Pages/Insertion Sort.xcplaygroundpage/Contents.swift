/*:
[Previous](@previous)
****
# Insertion Sort
*/
import UIKit

var array = randomArray(100, maxNumber: 100)

var iterations = 0
var visualisation = 0

if #available(iOS 9, *) {
    var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
    arrayView.values = array
    arrayView.captureView("View")
    
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
        arrayView.values = array
        arrayView.captureView("View")
    }
}
//: [Next](@next)
