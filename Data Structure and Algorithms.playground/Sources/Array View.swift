import UIKit
import XCPlayground

public class ArrayStackView: UIView {
    public var values: [Int] = [] {
        didSet {
            updateAllViews()
        }
    }
    
    var maxHeight = 0
    
    convenience public init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .grayColor()
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func insertValues(newValues: [Int], startingFrom start: Int) {
        var currentValues = values
        
        for (index, value) in newValues.enumerate() {
            currentValues[index + start] = value
        }
        
        values = currentValues
    }
    
    func updateAllViews() {
        for view in subviews {
            view.removeFromSuperview()
        }
        
        let width = frame.width / CGFloat(values.count)
        
        if subviews.count == 0 {
            for value in values {
                if value > maxHeight {
                    maxHeight = value
                }
            }
            
            for (index, value) in values.enumerate() {
                addViewWithHeight(value, width: width, x: width*CGFloat(index), maxHeight: maxHeight)
            }
        } else {
            for (index, view) in subviews.enumerate() {
                configureView(view, percentage: CGFloat(maxHeight/values[index]))
            }
        }
        
    }
    
    public func captureView(identifier: String) {
        XCPCaptureValue(identifier, value: self)
    }
    
    public func showView(identifier: String) {
        XCPShowView(identifier, view: self)
    }
    
    func addViewWithHeight(height: Int, width: CGFloat, x: CGFloat, maxHeight: Int) {
        let percentage = CGFloat(height) / CGFloat(maxHeight)
        let view = UIView(frame: CGRect(x: x, y: 0, width: width, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        configureView(view, percentage: percentage)
        addSubview(view)
    }
    
    func configureView(view: UIView, percentage: CGFloat) {
        let height = self.frame.height * percentage
        view.frame = CGRect(x: view.frame.origin.x, y: self.frame.height - height, width: view.frame.width, height: height)
        view.backgroundColor = colorForPercentage(percentage)
    }
    
    func colorForPercentage(percentage: CGFloat) -> UIColor {
        return UIColor(hue: percentage, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
}