/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Bubble sort

**Pseudo Code:**
* Repeat **n** times.
* Iterate the array.
* Compare each value to the next value.
* If the first value is higher then swap the values.
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
//: Iterate **n** times
for _ in array.indices {
//: Check each value in the array
    for i in 0..<array.count - 1 {
        iterations++
//: Compare current value to the next
        if array[i] > array[i+1] {
//: Swap
            swap(&array[i], &array[i+1])
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
