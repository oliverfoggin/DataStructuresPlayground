public class BinaryTree <T: Comparable> {
    public var value: T
    public var left: BinaryTree?
    public var right: BinaryTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public func add(value: T) {
        if value < self.value {
            if let l = left {
                l.add(value)
            } else {
                left = BinaryTree(value: value)
            }
        } else {
            if let r = right {
                r.add(value)
            } else {
                right = BinaryTree(value: value)
            }
        }
    }
    
    public func contains(value: T) -> Bool {
        if self.value == value {
            return true
        } else {
            if let l = left, r = right {
                return l.contains(value) || r.contains(value)
            }
        }
        return false
    }
    
    public func remove(value: T) {
        if self.value == value {
            if let l = left {
                let oldLeftValue = l.value
                self.value = l.value
                l.remove(oldLeftValue)
            } else if let r = right {
                let oldRightValue = r.value
                self.value = r.value
                r.remove(oldRightValue)
            }
        }
    }
    
    public func depth() -> Int {
        if left == nil && right == nil {
            return 0
        }
        
        var leftDepth = 0
        var rightDepth = 0
        
        if let l = left {
            leftDepth = l.depth()
        }
        
        if let r = right {
            rightDepth = r.depth()
        }
        
        return max(leftDepth, rightDepth) + 1
    }

    public func printInOrder() -> String {
        var string = ""
        
        if let l = left {
            string += l.printInOrder()
        }
        
        string += "\(value), "
        
        if let r = right {
            string += r.printInOrder()
        }
        
        return string
    }
}

extension BinaryTree: Comparable{}

public func == <T: Comparable> (lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
    return lhs.value == rhs.value
        && lhs.left == rhs.left
        && lhs.right == rhs.right
}

public func < <T: Comparable> (lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
    return lhs.value < rhs.value
}

public func <= <T: Comparable> (lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
    return lhs.value <= rhs.value
}

public func >= <T: Comparable> (lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
    return lhs.value >= rhs.value
}

public func > <T: Comparable> (lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
    return lhs.value > rhs.value
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        get {
            return self.treeString(isTail: true)
        }
    }
    
    private func treeString(prefix: String = "", isTail: Bool) -> String {
        var result = ""
        
        if let r = right {
            let newPrefix = prefix + (isTail ? "│   " : "    ")
            result += r.treeString(newPrefix, isTail: false)
        }
        
        result += prefix + (isTail ? "└── " : "┌── ") + "\(value)" + "\n"
        
        if let l = left {
            let newPrefix = prefix + (isTail ? "    " : "│   ")
            result += l.treeString(newPrefix, isTail: true)
        }
        
        return result
    }
}

import UIKit

extension BinaryTree: CustomPlaygroundQuickLookable {
    public func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = description
        label.sizeToFit()
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: label.frame.width, height: label.frame.height))
        view.backgroundColor = .lightGrayColor()
        view.addSubview(label)
        
        return PlaygroundQuickLook(reflecting: view)
    }
}