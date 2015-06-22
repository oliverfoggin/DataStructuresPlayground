/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Shell Sort
*/

import XCPlayground

//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 57
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)

var iterations = 0

//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

let gaps = [701, 301, 132, 57, 23, 10, 4, 1]

for gap in gaps where gap <= array.count {
    for i in gap..<array.count {
        let temp = array[i]
        var j = i
        
        while j >= gap && array[j - gap] > temp {
            array[j] = array[j - gap]
            j-=gap
            iterations++
            arrayView.values = array
            arrayView.captureView("View")
        }
        
        array[j] = temp
    }
}

/*:
**Iteration Count**
*/
iterations

/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
