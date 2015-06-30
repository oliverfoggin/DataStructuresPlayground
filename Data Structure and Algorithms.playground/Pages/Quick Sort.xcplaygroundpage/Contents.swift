/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Quick Sort
*/
//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 100
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)

var iterations = 0
//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")
/*:
    func quickSort(inout array: [Int], start: Int, end: Int) {
        if start < end {
            let p = partition(&array, start: start, end: end)
            quickSort(&array, start: start, end: p-1)
            quickSort(&array, start: p+1, end: end)
        }
    }

    func partition(inout array: [Int], start: Int, end: Int, view: ArrayStackView, inout iterations: Int) -> Int {
        let pivotIndex = choosePivot(array, start: start, end: end)
        let pivotValue = array[pivotIndex]
        swap(&array[pivotIndex], &array[end])
        
        var storeIndex = start
        
        for index in start..<end {
            if array[index] < pivotValue {
                swap(&array[index], &array[storeIndex++])
            }
        }
        swap(&array[end], &array[storeIndex])
        return storeIndex
    }

    func choosePivot(array: [Int], start: Int, end: Int) -> Int {
        let first = array[start]
        let last = array[end]
        let mid = array[(end - start) / 2 + start]

        return [(first, start), (mid, (end - start) / 2 + start), (last, end)].sort{$0.0 < $1.0}[1].1
    }
*/
quickSort(&array, start: 0, end: array.count - 1, view: arrayView, iterations: &iterations)
/*:
**Iteration Count**
*/
iterations
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
