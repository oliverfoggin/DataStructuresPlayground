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

func merge(a: [Int], b: [Int], mergeInto acc: [Int]) -> [Int] {
    if a == [] {
        return acc + b
    } else if b == [] {
        return acc + a
    }
    
    if a[0] < b[0] {
        return merge(Array(a[1..<a.count]), b: b, mergeInto: acc + [a[0]])
    } else {
        return merge(a, b: Array(b[1..<b.count]), mergeInto: acc + [b[0]])
    }
}

func mergeSort(a: [Int]) -> [Int] {
    arrayView.values = a
    arrayView.captureView("View")
    if a.count <= 1 {
        return a
    } else {
        let firstHalf = Array(a[0..<a.count/2])
        let secondHalf = Array(a[a.count/2..<a.count])
        
        let array = merge(mergeSort(firstHalf), b: mergeSort(secondHalf), mergeInto: [])
        
        arrayView.values = array
        arrayView.captureView("View")
        
        return array
    }
}

let sortedArray = mergeSort(array)
//: [Next](@next)
