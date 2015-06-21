import Foundation
import UIKit

public extension MutableCollectionType where Index == Int, Generator.Element : Equatable {
    func myIndexOf(element: Generator.Element) -> Index? {
        for i in self.indices {
            if self[i] == element {
                return i
            }
        }
        return nil
    }
}

public func randomArray(count: Int, maxNumber: UInt32) -> [Int] {
    var array = [Int]()
    
    for _ in 1...count {
        array.append(Int(arc4random_uniform(maxNumber)))
    }
    
    return array
}