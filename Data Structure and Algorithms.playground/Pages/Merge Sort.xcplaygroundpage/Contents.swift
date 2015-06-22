/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Merge Sort
*/


//: Change the **arrayLength** value to see how the length affects performance
let arrayLength = 50
let maxNumber = 1000
var array = randomArray(arrayLength, maxNumber: maxNumber)

//: Setting up the view to display the algorithm
let arrayView = ArrayStackView()
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
        
        let array = merge(startIndex, a: mergeSort(startIndex, a: firstHalf), b: mergeSort(startIndex + a.count/2, a: secondHalf))
        
        return array
    }
}

let sortedArray = mergeSort(0, a: array)
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
