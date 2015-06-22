/*:
[Previous](@previous)
****
# Merge Sort
*/
import UIKit

let array = randomArray(200, maxNumber: 1000)

var arrayView = ArrayStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
arrayView.values = array
arrayView.captureView("View")

func merge(startIndex: Int, a: [Int], b: [Int]) -> [Int] {
    var mergedArray = [Int]()
    
    var leftArray = a
    var rightArray = b
    
    while leftArray.count > 0
        && rightArray.count > 0 {
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

func mergeSort(startIndex: Int, a: [Int]) -> [Int] {
    if a.count <= 1 {
        return a
    } else {
        let firstHalf = Array(a[0..<a.count/2])
        let secondHalf = Array(a[a.count/2..<a.count])
        
        let array = merge(startIndex, mergeSort(startIndex, firstHalf), mergeSort(startIndex + a.count/2,a: secondHalf))
        
        return array
    }
}

let sortedArray = mergeSort(array)
//: [Next](@next)
