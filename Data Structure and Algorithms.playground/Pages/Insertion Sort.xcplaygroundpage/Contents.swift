/*:
[Previous](@previous)
****
# Insertion Sort
*/
import Foundation

extension MutableCollectionType where Self: RangeReplaceableCollectionType, Index == Int, Generator.Element: Comparable {
    mutating func insertionSort() {
        var viewIteration = 0
        for (index, number) in enumerate() {
            for i in 0...index {
                ++iterations
                if self[i] > number {
                    removeAtIndex(index)
                    insert(number, atIndex: i)
                    break
                }
            }
            visualize("iteration\(viewIteration++)")
        }
    }
}

var array = randomArray(20, maxNumber: 100)

array.insertionSort()

iterations

//: [Next](@next)
