/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Heap Sort
*/
import Foundation
//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 50
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)

var iterations = 0
//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")
/*:
    func heapsort(inout array: [Int]){
        heapify(&array)
        for end in stride(from: array.count - 1, to: 0, by: -1) {
            swap(&array[end], &array[0])
            siftDownn(&array, start: 0, end: end - 1)
        }
    }

    func heapify(inout array: [Int]){
        for start in stride(from: Int(floor((Double(array.count) - 2.0) / 2.0)), through: 0, by: -1) {
            siftDownn(&array, start: start, end: array.count - 1)
        }
    }

    func siftDownn(inout array: [Int], start: Int, end: Int) {
        var root = start

        while root * 2 + 1 <= end {
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
                swap(&array[swap], &array[root])
                root = swap
            }
        }
    }
*/
heapsort(&array, arrayView: arrayView, iterations: &iterations)
/*:
**Iteration Count**
*/
iterations
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
