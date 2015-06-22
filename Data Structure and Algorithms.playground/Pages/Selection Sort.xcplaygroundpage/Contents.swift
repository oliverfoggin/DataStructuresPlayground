/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Selection Sort
*/
//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 50
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)

var iterations = 0
//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

for index in array.indices {
    var lowest = Int.max
    var lowestIndex = 0
    
    for i in index..<array.count {
        iterations++
        if array[i] < lowest {
            lowest = array[i]
            lowestIndex = i
        }
    }
    swap(&array[index], &array[lowestIndex])
    arrayView.values = array
    arrayView.captureView("View")
}
/*:
**Iteration Count**
*/
iterations
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
