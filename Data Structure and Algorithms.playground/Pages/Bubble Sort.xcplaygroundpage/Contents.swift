/*:
****
# Bubble sort
*/
import Foundation

var iterations = 0

extension MutableCollectionType where Index == Int, Generator.Element : Comparable {
    
    mutating func bubbleSort() {
        if self.count == 0 {return }
        var sorted = false
        var viewIteration = 0
        while sorted == false {
            visualize("iteration\(viewIteration++)")
            sorted = true
            for i in 0..<count - 1 {
                ++iterations
                if self[i] > self[i+1] {
                    swap(&self[i], &self[i+1])
                    sorted = false
                }
            }
        }
    }
}

var array = randomArray(20, maxNumber: 100)

array.bubbleSort()

iterations
//: [Next](@next)
