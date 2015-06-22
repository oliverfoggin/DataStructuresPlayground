/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Heap Sort
*/
import Foundation
//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 50
let maxNumber = 100
var array = randomArray(arrayLength, maxNumber: maxNumber)

var iterations = 0
//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

func heapsort(inout array: [Int]){
    heapify(&array)
    var end = array.count - 1
    while end > 0 {
        swap(&array[end--], &array[0])
        siftDownn(&array, start: 0, end: end)
        arrayView.values = array
        arrayView.captureView("View")
    }
}

func heapify(inout array: [Int]){
    var start: Int = Int(floor((Double(array.count) - 2.0) / 2.0))
    while start >= 0 {
        siftDownn(&array, start: start, end: array.count - 1)
        start--
    }
}

func siftDownn(inout array: [Int], start: Int, end: Int) {
    var root = start
    
    while root * 2 + 1 <= end {
        iterations++
        
        let leftChild = root * 2 + 1
        let rightChild = leftChild + 1
        var swap = root
        
        if array[swap] < array[leftChild] {
            swap = leftChild
        }
        if rightChild <= end
            && array[swap] < array[rightChild] {
                swap = rightChild
        }
        if swap == root {
            return
        }
        else {
            let temp = array[swap]
            array[swap] = array[root]
            array[root] = temp
            root = swap
            arrayView.values = array
            arrayView.captureView("View")
        }
    }
}

heapsort(&array)
/*:
**Iteration Count**
*/
iterations
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
