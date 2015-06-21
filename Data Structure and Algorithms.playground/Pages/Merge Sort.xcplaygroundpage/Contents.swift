/*:
[Previous](@previous)
****
# Merge Sort
*/
import UIKit
import XCPlayground

var iteration = 0

func elementsInRange<T>(a: [T], start: Int, end: Int) -> ([T]) {
    var result = [T]()
    
    for x in start..<end {
        result.append(a[x])
    }
    
    return result
}

func merge<T: Comparable>(a: [T], b: [T], mergeInto acc: [T]) -> [T] {
    a.visualize("iteration\(iteration)")
    b.visualize("iteration\(iteration)")
    iteration++
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

func mergeSort<T: Comparable>(a: [T]) -> [T] {
    if a.count <= 1 {
        return a
    } else {
        let firstHalf = elementsInRange(a, start: 0, end: a.count/2)
        let secondHalf = elementsInRange(a, start: a.count/2, end: a.count)
        
        return merge(mergeSort(firstHalf), b: mergeSort(secondHalf), mergeInto: [])
    }
}

let array = randomArray(20, maxNumber: 100)

let sortedArray = mergeSort(array)

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = .yellowColor()
XCPShowView("", view: view)

//: [Next](@next)
