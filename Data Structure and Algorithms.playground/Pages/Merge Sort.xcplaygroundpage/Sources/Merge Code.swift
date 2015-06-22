import Foundation

public func merge(startIndex: Int, a: [Int], b: [Int], arrayView: ArrayStackView, inout iterations: Int) -> [Int] {
    var mergedArray = [Int]()
    
    var leftArray = a
    var rightArray = b
    
    while leftArray.count > 0
        && rightArray.count > 0 {
            iterations++
            if leftArray[0] < rightArray[0] {
                mergedArray.append(leftArray[0])
                leftArray.removeAtIndex(0)
            } else {
                mergedArray.append(rightArray[0])
                rightArray.removeAtIndex(0)
            }
            arrayView.insertValues(mergedArray + leftArray + rightArray, startingFrom: startIndex)
            arrayView.captureView("View")
    }
    
    if leftArray.count > 0 {
        mergedArray = mergedArray + leftArray
    } else if rightArray.count > 0 {
        mergedArray = mergedArray + rightArray
    }
    
    arrayView.insertValues(mergedArray, startingFrom: startIndex)
    arrayView.captureView("View")
    
    return mergedArray
}

public func mergeSort(startIndex: Int, inout a: [Int], arrayView: ArrayStackView, inout iterations: Int) {
    if a.count <= 1 {
        return
    } else {
        var firstHalf = Array(a[0..<a.count/2])
        var secondHalf = Array(a[a.count/2..<a.count])
        
        mergeSort(startIndex, a: &firstHalf, arrayView: arrayView, iterations: &iterations)
        mergeSort(startIndex + a.count/2, a: &secondHalf, arrayView: arrayView, iterations: &iterations)
        
        a = merge(startIndex, a: firstHalf, b: secondHalf, arrayView: arrayView, iterations: &iterations)
    }
}