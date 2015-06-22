import Foundation

public func heapsort(inout array: [Int], arrayView: ArrayStackView, inout iterations: Int){
    heapify(&array, arrayView: arrayView, iterations: &iterations)
    for end in stride(from: array.count - 1, to: 0, by: -1) {
        swap(&array[end], &array[0])
        siftDownn(&array, start: 0, end: end - 1, arrayView: arrayView, iterations: &iterations)
        arrayView.values = array
        arrayView.captureView("View")
    }
}

func heapify(inout array: [Int], arrayView: ArrayStackView, inout iterations: Int){
    for start in stride(from: Int(floor((Double(array.count) - 2.0) / 2.0)), through: 0, by: -1) {
        siftDownn(&array, start: start, end: array.count - 1, arrayView: arrayView, iterations: &iterations)
    }
}

func siftDownn(inout array: [Int], start: Int, end: Int, arrayView: ArrayStackView, inout iterations: Int) {
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