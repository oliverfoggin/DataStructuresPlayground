/*:
[Previous](@previous)
****
# Merge Sort
*/
import UIKit

let array = randomArray(10, maxNumber: 100)

var iteration = 0
var visualisation = 0

func elementsInRange(a: [Int], start: Int, end: Int) -> [Int] {
    var result = [Int]()
    
    for x in start..<end {
        result.append(a[x])
    }
    
    return result
}

func merge(a: [Int], b: [Int], mergeInto acc: [Int]) -> [Int] {
    if a == [] {
        return acc + b
    } else if b == [] {
        return acc + a
    }
    
    if a[0] < b[0] {
        return merge(elementsInRange(a, start: 1, end: a.count), b: b, mergeInto: acc + [a[0]])
    } else {
        return merge(a, b: elementsInRange(b, start: 1, end: b.count), mergeInto: acc + [b[0]])
    }
}

func mergeSort(a: [Int]) -> [Int] {
    visualize("Iteration\(visualisation++)", array: a)
    if a.count <= 1 {
        return a
    } else {
        let firstHalf = elementsInRange(a, start: 0, end: a.count/2)
        let secondHalf = elementsInRange(a, start: a.count/2, end: a.count)
        
        let array = merge(mergeSort(firstHalf), b: mergeSort(secondHalf), mergeInto: [])
        
        visualize("Merge\(visualisation++)", array: array)
        
        return array
    }
}

let sortedArray = mergeSort(array)
//: [Next](@next)
