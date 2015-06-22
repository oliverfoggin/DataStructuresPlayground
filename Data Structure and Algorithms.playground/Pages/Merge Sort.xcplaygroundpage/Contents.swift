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

var iterations = 0
/*:
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
        }
        
        if leftArray.count > 0 {
            mergedArray = mergedArray + leftArray
        } else if rightArray.count > 0 {
            mergedArray = mergedArray + rightArray
        }
        return mergedArray
    }

    public func mergeSort(startIndex: Int, inout a: [Int]) {
        if a.count <= 1 {
            return
        } else {
            var firstHalf = Array(a[0..<a.count/2])
            var secondHalf = Array(a[a.count/2..<a.count])
            
            mergeSort(startIndex, a: &firstHalf)
            mergeSort(startIndex + a.count/2, a: &secondHalf)
            
            a = merge(startIndex, a: firstHalf, b: secondHalf)
        }
    }
*/

mergeSort(0, a: &array, arrayView: arrayView, iterations: &iterations)
/*:
**Iteration Count**
*/
iterations
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
