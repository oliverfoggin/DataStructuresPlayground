/*:
[Previous](@previous)
****
# Selection Sort
*/
import Foundation

//extension MutableCollectionType where Self: RangeReplaceableCollectionType, Index == Int, Generator.Element == Int {
//    mutating func selectionSort() {
//        var viewIteration = 0
//        for index in indices {
//            var lowest = Int.max
//            var lowestIndex = 0
//            
//            for i in index..<self.count {
//                if self[i] < lowest {
//                    lowest = self[i]
//                    lowestIndex = i
//                }
//            }
//            swap(&self[index], &self[lowestIndex])
//            
//            visualize("iteration\(viewIteration++)")
//        }
//    }
//}

var array = randomArray(10, maxNumber: 100)

var iterations = 0
var visualisation = 0

for index in array.indices {
    var lowest = Int.max
    var lowestIndex = 0
    
    for i in index..<array.count {
        if array[i] < lowest {
            lowest = array[i]
            lowestIndex = i
        }
        swap(&array[index], &array[lowestIndex])
        visualize("Iteration\(visualisation++)", array: array)
    }
}

array
//: [Next](@next)
