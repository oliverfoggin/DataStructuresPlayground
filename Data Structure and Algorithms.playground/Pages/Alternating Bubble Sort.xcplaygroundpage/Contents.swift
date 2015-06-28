/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Alternating bubble sort
*/
//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 100
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)
//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

var iterations = 0
for _ in 0..<Int(array.count / 2) {
    for i in 0..<array.count - 1 {
        if array[i] > array[i+1] {
            swap(&array[i], &array[i+1])
            arrayView.values = array
            arrayView.captureView("View")
        }
    }
    arrayView.values = array
    arrayView.captureView("View")
    
    for i in stride(from: array.count - 1, through: 1, by: -1) {
        iterations++
        if array[i] < array[i-1] {
            swap(&array[i], &array[i-1])
            arrayView.values = array
            arrayView.captureView("View")
        }
    }
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
