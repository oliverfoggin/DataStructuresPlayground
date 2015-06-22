/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Fisher-Yates Shuffle
*/

import UIKit

var array = Array(0...100)

let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

func shuffle(var array: [Int]) -> [Int] {
    for i in 0..<array.count - 1 {
        let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
        swap(&array[i], &array[j])
        
        arrayView.values = array
        arrayView.captureView("View")
    }
    return array
}

shuffle(array)

/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
