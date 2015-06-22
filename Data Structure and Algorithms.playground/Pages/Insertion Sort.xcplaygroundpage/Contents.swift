/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Insertion Sort
*/
//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 50
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)

var iterations = 0
//: Setting up the view to display the algorithm
var arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

for (index, number) in array.enumerate() {
    for i in 0...index {
        iterations++
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

/*:
**Iteration Count**
*/
iterations
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
