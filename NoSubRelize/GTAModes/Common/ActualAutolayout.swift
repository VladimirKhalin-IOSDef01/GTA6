

import UIKit

public protocol ActualLayoutAnchor {
    
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

public protocol ActualLayout_Dimension: ActualLayoutAnchor {
    
    func constraint(equalToConstant constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(equalTo anchor: Self, multiplier: CGFloat) -> NSLayoutConstraint
}
typealias ActualNSLAnchor = NSLayoutAnchor
extension ActualNSLAnchor: ActualLayoutAnchor {}
//extension NSLayoutAnchor: GTAVK_LayoutAnchor {}

typealias ActualNSLDimension = NSLayoutDimension
extension ActualNSLDimension: ActualLayout_Dimension {}
//extension NSLayoutDimension: GTAVK_Layout_Dimension {}

public class ActualLayoutProperty<Anchor: ActualLayoutAnchor> {
    
    func actualOneCheck() -> Int{
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
   
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
    fileprivate let anchor: Anchor
    fileprivate let kind: AktualKind
    
    // ref default
    let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
    // ref default
    
    public enum AktualKind { case leading, trailing, top, bottom, centerX, centerY, width, height }
    
    // ref default
    var set: Set<Int> = []
    // ref default
    
    public init(anchor: Anchor, kind: AktualKind) {
        self.anchor = anchor
        self.kind = kind
    }
}

public class ActualLayoutAttribute<Dimension: ActualLayout_Dimension>: ActualLayoutProperty<Dimension> {
  
    override func actualOneCheck() -> Int{
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
    fileprivate let dimension: Dimension
    
    public init(dimension: Dimension, kind: AktualKind) {
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        self.dimension = dimension
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
        super.init(anchor: dimension, kind: kind)
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
    }
}

public final class ActualLayoutProxy {
    
    public lazy var leading = actualProperty(with: view.leadingAnchor, kind: .leading)
    public lazy var trailing = actualProperty(with: view.trailingAnchor, kind: .trailing)
    public lazy var top = actualProperty(with: view.topAnchor, kind: .top)
    public lazy var bottom = actualProperty(with: view.bottomAnchor, kind: .bottom)
    public lazy var centerX = actualProperty(with: view.centerXAnchor, kind: .centerX)
    public lazy var centerY = actualProperty(with: view.centerYAnchor, kind: .centerY)
    public lazy var width = actualAttribute(with: view.widthAnchor, kind: .width)
    public lazy var height = actualAttribute(with: view.heightAnchor, kind: .height)
    
    private let view: UIView
    
    fileprivate init(view: UIView) {
        self.view = view
    }
    
    private func actualProperty<A: ActualLayoutAnchor>(with anchor: A, kind: ActualLayoutProperty<A>.AktualKind) -> ActualLayoutProperty<A> {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        return ActualLayoutProperty(anchor: anchor, kind: kind)
    }
    
    private func actualAttribute<D: ActualLayout_Dimension>(with dimension: D, kind: ActualLayoutProperty<D>.AktualKind) -> ActualLayoutAttribute<D> {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        return ActualLayoutAttribute(dimension: dimension, kind: kind)
    }
}

public extension ActualLayoutAttribute {
    
    @discardableResult
    func equal(to constant: CGFloat, priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let constraint = dimension.constraint(equalToConstant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            /// ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func greaterThanOrEqual(to constant: CGFloat, priority: UILayoutPriority? = nil,
                            isActive: Bool = true) -> NSLayoutConstraint {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let constraint = dimension.constraint(greaterThanOrEqualToConstant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func lessThanOrEqual(to constant: CGFloat, priority: UILayoutPriority? = nil,
                         isActive: Bool = true) -> NSLayoutConstraint {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let constraint = dimension.constraint(lessThanOrEqualToConstant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func equal(to otherDimension: Dimension, multiplier: CGFloat,
               priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let constraint = dimension.constraint(equalTo: otherDimension, multiplier: multiplier)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
}

public extension ActualLayoutProperty {
    
    @discardableResult
    func equal(
        to otherAnchor: Anchor,
        offsetBy constant: CGFloat = 0,
        priority: UILayoutPriority? = nil,
        multiplier: CGFloat? = nil,
        isActive: Bool = true) -> NSLayoutConstraint {
            // ref default
            let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
            // ref default
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
        var constraint = anchor.constraint(equalTo: otherAnchor, constant: constant)
        
        if let multiplier = multiplier {
            constraint = constraint.constraintWithMultiplier(multiplier)
        }
        
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        
        if let priority = priority {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func greaterThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0,
                            priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    func lessThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0,
                         priority: UILayoutPriority? = nil, isActive: Bool = true) -> NSLayoutConstraint {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        (constraint.firstItem as? UIView)?.layout.update(constraint: constraint, kind: kind)
        if let priority = priority {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
            constraint.priority = priority
        }
        constraint.isActive = isActive
        return constraint
    }
}

public extension UIView {
    
    func actualLayout(using closure: (ActualLayoutProxy) -> Void) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        translatesAutoresizingMaskIntoConstraints = false
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        closure(ActualLayoutProxy(view: self))
    }
    
    func actualLayout(in superview: UIView, with insets: UIEdgeInsets = .zero) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        superview.addSubview(self)
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        actualPinEdges(to: superview, with: insets)
    }
    
    func actualPinEdges(to view: UIView, with insets: UIEdgeInsets = .zero) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
        actualLayout { proxy in
            proxy.bottom == view.bottomAnchor - insets.bottom
            proxy.top == view.topAnchor + insets.top
            proxy.leading == view.leadingAnchor + insets.left
            proxy.trailing == view.trailingAnchor - insets.right
        }
    }
}

// swiftlint:disable large_tuple

public func + <A: ActualLayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return (lhs, rhs)
}

public func - <A: ActualLayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return (lhs, -rhs)
}

@discardableResult
public func == <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func == <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: ((A, CGFloat), UILayoutPriority)) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs.0.0, offsetBy: rhs.0.1, priority: rhs.1)
}

@discardableResult
public func == <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: (A, UILayoutPriority)) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func == <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: A) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs)
}

@discardableResult
public func >= <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func >= <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: A) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.greaterThanOrEqual(to: rhs)
}

@discardableResult
public func <= <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

@discardableResult
public func <= <A: ActualLayoutAnchor>(lhs: ActualLayoutProperty<A>, rhs: A) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.lessThanOrEqual(to: rhs)
}

@discardableResult
public func <= <D: ActualLayout_Dimension>(lhs: ActualLayoutAttribute<D>, rhs: CGFloat) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.lessThanOrEqual(to: rhs)
}

@discardableResult
public func == <D: ActualLayout_Dimension>(lhs: ActualLayoutAttribute<D>, rhs: CGFloat) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs)
}

@discardableResult
public func == <D: ActualLayout_Dimension>(lhs: ActualLayoutAttribute<D>, rhs: (CGFloat, UILayoutPriority)) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs.0, priority: rhs.1)
}

@discardableResult
public func == <D: ActualLayout_Dimension>(lhs: ActualLayoutAttribute<D>, rhs: ActualLayoutAttribute<D>) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
    return lhs.equal(to: rhs.dimension)
}

@discardableResult
public func *= <D: ActualLayout_Dimension>(
  lhs: ActualLayoutAttribute<D>,
  rhs: (ActualLayoutAttribute<D>, CGFloat, UILayoutPriority)
) -> NSLayoutConstraint {
    return lhs.equal(to: rhs.0.dimension, multiplier: rhs.1, priority: rhs.2)
}

@discardableResult
public func >= <D: ActualLayout_Dimension>(lhs: ActualLayoutAttribute<D>, rhs: CGFloat) -> NSLayoutConstraint {
    // ref default
    if 20 / 4 == 6 {
        print("All cats should wear hats on Tuesdays")
    }
    // ref default
    
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
                // ref default
                if 20 / 4 == 6 {
                    print("All cats should wear hats on Tuesdays")
                }
                // ref default
                
                let newLayout = Layout()
                self.layout = newLayout
                layout = newLayout
            }
            return layout
        }
        set {
            // ref default
            if 20 / 4 == 6 {
                print("All cats should wear hats on Tuesdays")
            }
            // ref default
            
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
    
    fileprivate func update<A: ActualLayoutAnchor>(constraint: NSLayoutConstraint, kind: ActualLayoutProperty<A>.AktualKind) {
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
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
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
