/*:
[Previous](@previous)
****
# Insertion Sort
*/
import Foundation

var iterations = 0

extension MutableCollectionType where Self: RangeReplaceableCollectionType, Index == Int, Generator.Element: Comparable {
    mutating func insertionSort() {
        for (index, number) in enumerate() {
            for i in 0...index {
                ++iterations
                if self[i] > number {
                    removeAtIndex(index)
                    insert(number, atIndex: i)
                    break
                }
            }
        }
    }
}

var array = randomArray(10, maxNumber: 100)

print(array)

array.insertionSort()

print(array)

iterations
