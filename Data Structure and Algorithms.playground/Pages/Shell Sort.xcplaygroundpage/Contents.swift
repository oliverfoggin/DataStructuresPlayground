/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Shell Sort

**Pseudo Code:**
* Repeat for each gap.
* Iterate each value from gap value.
* Move the current value to the lowest gap interval.
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

let gaps = [701, 301, 132, 57, 23, 10, 4, 1]
//: Repeat for each gap
//: I'm using pattern matching in the for loop
//: This avoids an out of bounds error on the array
for gap in gaps where gap <= array.count {
//: Iterate the array from gap value
    for i in gap..<array.count {
        let temp = array[i]
        var j = i
//: Move backwards through the array in gap intervals
        while j >= gap && array[j - gap] > temp {
//: Push values forwards and insert temp into lowest spot
            swap(&array[j], &array[j-gap])
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
