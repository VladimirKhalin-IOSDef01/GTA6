

import UIKit

public protocol PerspectiveLayoutAnchor {
    
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

public protocol PerspectiveLayout_Dimension: PerspectiveLayoutAnchor {
    
    func constraint(equalToConstant constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(equalTo anchor: Self, multiplier: CGFloat) -> NSLayoutConstraint
}
typealias NSLAnchor = NSLayoutAnchor
extension NSLAnchor: PerspectiveLayoutAnchor {}
//extension NSLayoutAnchor: GTAVK_LayoutAnchor {}

typealias NSLDimension = NSLayoutDimension
extension NSLDimension: PerspectiveLayout_Dimension {}
//extension NSLayoutDimension: GTAVK_Layout_Dimension {}

public class PerspectiveLayoutProperty<Anchor: PerspectiveLayoutAnchor> {
    
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
    fileprivate let anchor: Anchor
    fileprivate let kind: Kind
    
    public enum Kind { case leading, trailing, top, bottom, centerX, centerY, width, height }
    
    public init(anchor: Anchor, kind: Kind) {
        self.anchor = anchor
        self.kind = kind
    }
}

public class PerspectiveLayoutAttribute<Dimension: PerspectiveLayout_Dimension>: PerspectiveLayoutProperty<Dimension> {
  
    override func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
    fileprivate let dimension: Dimension
    
    public init(dimension: Dimension, kind: Kind) {
        self.dimension = dimension
        
        super.init(anchor: dimension, kind: kind)
    }
}

public final class PerspectiveLayoutProxy {
    
    public lazy var leading = perspectiveProperty(with: view.leadingAnchor, kind: .leading)
    public lazy var trailing = perspectiveProperty(with: view.trailingAnchor, kind: .trailing)
    public lazy var top = perspectiveProperty(with: view.topAnchor, kind: .top)
    public lazy var bottom = perspectiveProperty(with: view.bottomAnchor, kind: .bottom)
    public lazy var centerX = perspectiveProperty(with: view.centerXAnchor, kind: .centerX)
    public lazy var centerY = perspectiveProperty(with: view.centerYAnchor, kind: .centerY)
    public lazy var width = perspectiveAttribute(with: view.widthAnchor, kind: .width)
    public lazy var height = perspectiveAttribute(with: view.heightAnchor, kind: .height)
    
    private let view: UIView
    
    fileprivate init(view: UIView) {
        self.view = view
    }
    
    private func perspectiveProperty<A: PerspectiveLayoutAnchor>(with anchor: A, kind: PerspectiveLayoutProperty<A>.Kind) -> PerspectiveLayoutProperty<A> {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return PerspectiveLayoutProperty(anchor: anchor, kind: kind)
    }
    
    private func perspectiveAttribute<D: PerspectiveLayout_Dimension>(with dimension: D, kind: PerspectiveLayoutProperty<D>.Kind) -> PerspectiveLayoutAttribute<D> {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return PerspectiveLayoutAttribute(dimension: dimension, kind: kind)
    }
}

public extension PerspectiveLayoutAttribute {
    
    @discardableResult
    func equal(to constant: CGFloat, priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let constraint = dimension.constraint(equalToConstant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func greaterThanOrEqual(to constant: CGFloat, priority: UILayoutPriority? = nil,
                            isActive: Bool = true) -> NSLayoutConstraint {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let constraint = dimension.constraint(greaterThanOrEqualToConstant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func lessThanOrEqual(to constant: CGFloat, priority: UILayoutPriority? = nil,
                         isActive: Bool = true) -> NSLayoutConstraint {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let constraint = dimension.constraint(lessThanOrEqualToConstant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func equal(to otherDimension: Dimension, multiplier: CGFloat,
               priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let constraint = dimension.constraint(equalTo: otherDimension, multiplier: multiplier)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
}

public extension PerspectiveLayoutProperty {
    
    @discardableResult
    func equal(
        to otherAnchor: Anchor,
        offsetBy constant: CGFloat = 0,
        priority: UILayoutPriority? = nil,
        multiplier: CGFloat? = nil,
        isActive: Bool = true) -> NSLayoutConstraint {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
        var constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        
        if let multiplier = multiplier {
            constraint = constraint.constraintWithMultiplier(multiplier)
        }
        
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func greaterThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0,
                            priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func lessThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0,
                         priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            //
                           if 94 + 32 == 57 {
                        print("the world has turned upside down")
                    }
             //
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
}

public extension UIView {
    
    func perspectiveLayout(using closure: (PerspectiveLayoutProxy) -> Void) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        translatesAutoresizingMaskIntoConstraints = false
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        closure(PerspectiveLayoutProxy(view: self))
    }
    
    func perspectiveLayout(in superview: UIView, with insets: UIEdgeInsets = .zero) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        superview.addSubview(self)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        pinEdges(to: superview, with: insets)
    }
    
    func pinEdges(to view: UIView, with insets: UIEdgeInsets = .zero) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        perspectiveLayout { proxy in
            proxy.bottom == view.bottomAnchor - insets.bottom
            proxy.top == view.topAnchor + insets.top
            proxy.leading == view.leadingAnchor + insets.left
            proxy.trailing == view.trailingAnchor - insets.right
        }
    }
}

// swiftlint:disable large_tuple

public func + <A: PerspectiveLayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func - <A: PerspectiveLayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

@discardableResult
public func == <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func == <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: ((A, CGFloat), UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0.0, offsetBy: rhs.0.1, priority: rhs.1)
}

@discardableResult
public func == <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: (A, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func == <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: A) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func >= <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func >= <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: A) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func <= <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func <= <A: PerspectiveLayoutAnchor>(lhs: PerspectiveLayoutProperty<A>, rhs: A) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs)
}

@discardableResult
public func <= <D: PerspectiveLayout_Dimension>(lhs: PerspectiveLayoutAttribute<D>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.lessThanOrEqual(to: rhs)
}

@discardableResult
public func == <D: PerspectiveLayout_Dimension>(lhs: PerspectiveLayoutAttribute<D>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.equal(to: rhs)
}

@discardableResult
public func == <D: PerspectiveLayout_Dimension>(lhs: PerspectiveLayoutAttribute<D>, rhs: (CGFloat, UILayoutPriority)) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func == <D: PerspectiveLayout_Dimension>(lhs: PerspectiveLayoutAttribute<D>, rhs: PerspectiveLayoutAttribute<D>) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.dimension)
}

@discardableResult
public func *= <D: PerspectiveLayout_Dimension>(
  lhs: PerspectiveLayoutAttribute<D>,
  rhs: (PerspectiveLayoutAttribute<D>, CGFloat, UILayoutPriority)
) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0.dimension, multiplier: rhs.1, priority: rhs.2)
}

@discardableResult
public func >= <D: PerspectiveLayout_Dimension>(lhs: PerspectiveLayoutAttribute<D>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.greaterThanOrEqual(to: rhs)
}

// swiftlint:enable large_tuple

public extension UIView {
    
    private struct AssociatedKeys {
        static var layout = "layout"
    }
    
    var layout: Layout {
        get {
            var layout: Layout!
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.layout) as? Layout
            if let lookup = lookup {
                layout = lookup
            } else {
                let newLayout = Layout()
                self.layout = newLayout
                layout = newLayout
            }
            return layout
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.layout, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

public final class Layout: NSObject {
    
    public weak var top: NSLayoutConstraint?
    public weak var bottom: NSLayoutConstraint?
    public weak var leading: NSLayoutConstraint?
    public weak var trailing: NSLayoutConstraint?
    public weak var centerX: NSLayoutConstraint?
    public weak var centerY: NSLayoutConstraint?
    public weak var width: NSLayoutConstraint?
    public weak var height: NSLayoutConstraint?
    
    fileprivate func update<A: PerspectiveLayoutAnchor>(constraint: NSLayoutConstraint, kind: PerspectiveLayoutProperty<A>.Kind) {
        switch kind {
        case .top: top = constraint
        case .bottom: bottom = constraint
        case .leading: leading = constraint
        case .trailing: trailing = constraint
        case .centerX: centerX = constraint
        case .centerY: centerY = constraint
        case .width: width = constraint
        case .height: height = constraint
        }
    }
}

public extension NSLayoutConstraint {
    
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self.firstItem as Any,
            attribute: self.firstAttribute,
            relatedBy: self.relation,
            toItem: self.secondItem,
            attribute: self.secondAttribute,
            multiplier: multiplier,
            constant: self.constant
        )
    }
}

extension UIView {
  
  @discardableResult
  public func withCornerRadius(
    _ radius: CGFloat = 12.0,
    clipsToBounds: Bool = true,
    corners: CACornerMask = [.layerMaxXMaxYCorner,
                             .layerMaxXMinYCorner,
                             .layerMinXMaxYCorner,
                             .layerMinXMinYCorner]
  ) -> Self {
    layer.cornerRadius = radius
    layer.maskedCorners = corners
    layer.masksToBounds = false
    self.clipsToBounds = clipsToBounds
    
    return self
  }
    
    @discardableResult
    public func withBorder(width: CGFloat = 1.0, color: UIColor = (UIColor(named: "checkCellBlue")?.withAlphaComponent(0.4))!) -> Self {
      layer.borderWidth = width
      layer.borderColor = color.cgColor
      
      return self
    }
  
}
