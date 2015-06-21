/*:
[Previous](@previous)
****
# Selection Sort
*/
import Foundation

extension MutableCollectionType where Self: RangeReplaceableCollectionType, Index == Int, Generator.Element == Int {
    mutating func selectionSort() {
        var viewIteration = 0
        for index in indices {
            var lowest = Int.max
            var lowestIndex = 0
            
            for i in index..<self.count {
                if self[i] < lowest {
                    lowest = self[i]
                    lowestIndex = i
                }
            }
            swap(&self[index], &self[lowestIndex])
            
            visualize("iteration\(viewIteration++)")
        }
    }
}

var array = randomArray(20, maxNumber: 100)
    
array.selectionSort()
//: [Next](@next)
