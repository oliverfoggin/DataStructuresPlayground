/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
****
# Sleep Sort

**Pseudo Code:**
* Find the max value in the array
* For each value in the array
* Calculate a time delay based on the value as a percentage
* Dispatch a new thread after given time delay
* In the thread insert the value into new array
*/
import XCPlayground
import Foundation

var array = randomArray(100, maxNumber: 1000)

var resultArray = [Int]()

let arrayView = ArrayStackView()
arrayView.values = array
arrayView.captureView("View")

var iterations = 0

func showArray(array: [Int]) {
    arrayView.values = array
    arrayView.captureView("View")
}

var maxValue = 0

for v in array {
    if v > maxValue {
        maxValue = v
    }
}

let maxDelay = UInt64(NSEC_PER_SEC / 10) * UInt64(array.count)

func timeDelay(value: Int, maxValue: Int) -> Int64 {
    let minDelay = NSEC_PER_SEC * 3
    let percentage = Double(value) / Double(maxValue)
    
    return Int64((Double(maxDelay) - Double(minDelay)) * percentage) + Int64(minDelay)
}

let now = DISPATCH_TIME_NOW

for v in array {
    let time = dispatch_time(now, timeDelay(v, maxValue: maxValue))
    dispatch_after(time, dispatch_get_main_queue()) {
        resultArray.append(v)
        
        showArray(resultArray)
        
//        if (resultArray.count == array.count) {
//            showArray(resultArray)
//        }
    }
}

XCPSetExecutionShouldContinueIndefinitely()
/*:
****
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/
