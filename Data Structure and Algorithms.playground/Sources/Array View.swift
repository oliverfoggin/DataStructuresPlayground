import UIKit
import XCPlayground

@available(iOS 9.0, *)
public class ArrayStackView: UIView {
    public var values: [Int] = [] {
        didSet {
            updateArrangedViews()
        }
    }
    
    let stackView: UIStackView = {
        let s = UIStackView(frame: CGRectZero)
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = UILayoutConstraintAxis.Horizontal
        s.distribution = UIStackViewDistribution.FillEqually
        s.alignment = UIStackViewAlignment.Center
        s.layoutMarginsRelativeArrangement = true
        return s
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .grayColor()
        addSubview(stackView)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[stackView]|", options: NSLayoutFormatOptions.AlignAllBottom, metrics: nil, views: ["stackView": stackView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]|", options: NSLayoutFormatOptions.AlignAllBottom, metrics: nil, views: ["stackView": stackView]))
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateArrangedViews() {
        for view in stackView.arrangedSubviews {
            view.removeFromSuperview()
        }

        var maxValue = 0

        for value in values {
            if value > maxValue {
                maxValue = value
            }
        }
        
        for value in values {
            addViewWithHeight(value, maxHeight: maxValue)
        }
        
        print(stackView)
    }
    
    public func captureView(identifier: String) {
        XCPCaptureValue(identifier, value: self)
    }
    
    public func showView(identifier: String) {
        XCPShowView(identifier, view: self)
    }
    
    func addViewWithHeight(height: Int, maxHeight: Int) -> UIView {
        let percentage = CGFloat(height) / CGFloat(maxHeight)
        let view = UIView(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = colorForPercentage(percentage)
        view.layer.borderColor = UIColor.blackColor().CGColor
        view.layer.borderWidth = 1.0
        stackView.addArrangedSubview(view)
        view.addConstraint(NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self,
            attribute: NSLayoutAttribute.Height,
            multiplier: percentage,
            constant: 0.0))
        return view
    }
    
    func colorForPercentage(percentage: CGFloat) -> UIColor {
        return UIColor(hue: percentage, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
}