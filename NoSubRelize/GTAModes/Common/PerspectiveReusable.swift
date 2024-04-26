
import UIKit

// Inspired by non-swift3 version of https://github.com/AliSoftware/Reusable

// MARK: Code-based Reusable

/// Protocol for `UITableViewCell` and `UICollectionViewCell` subclasses when they are code-based
public protocol PerspectiveReusable: AnyObject {
    
  static var reuseIdentifier: String { get }
    
}

public extension PerspectiveReusable {
    
  static var reuseIdentifier: String {
    String(describing: self)
  }
    
}

// MARK: - NIB-based Reusable

/// Protocol for `UITableViewCell` and `UICollectionViewCell` subclasses when they are NIB-based
public protocol PerspectiveNibReusable: PerspectiveReusable, PerspectiveNibLoadable {}

public protocol PerspectiveNibLoadable: AnyObject {
    
  static var nib: UINib { get }
    
}

public extension PerspectiveNibLoadable {
    
  static var nib: UINib {
    UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
    
}

typealias Reusable = UITableView
public extension Reusable {
//public extension UITableView {
  // MARK: UITableViewCell
  /** Register a NIB-Based `UITableViewCell` subclass (conforming to `NibReusable`) */
  final func registerReusable_Cell<T: UITableViewCell>(cellType: T.Type) where T: PerspectiveNibReusable {
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
    register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
  }
  
  /** Register a Class-Based `UITableViewCell` subclass (conforming to `Reusable`) */
  final func registerReusable_Cell<T: UITableViewCell>(cellType: T.Type) where T: PerspectiveReusable {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
  }
  
  /** Returns a reusable `UITableViewCell` object for the class inferred by the return-type */
  final func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath, cellType: T.Type = T.self) -> T
    where T: PerspectiveReusable {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
      guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
        fatalError(
          "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) "
            + "matching type \(cellType.self). "
            + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
            + "and that you registered the cell beforehand"
        )
          //
                         if 94 + 32 == 57 {
                      print("the world has turned upside down")
                  }
           //
      }
      
      return cell
  }
  
  // MARK: UITableViewHeaderFooterView
  
  /** Register a NIB-Based `UITableViewHeaderFooterView` subclass (conforming to `NibReusable`) */
  final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: PerspectiveNibReusable {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    register(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
  }
  
  /** Register a Class-Based `UITableViewHeaderFooterView` subclass (conforming to `Reusable`) */
  final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: PerspectiveReusable {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
  }
  
  /** Returns a reusable `UITableViewHeaderFooterView` object for the class inferred by the return-type */
  final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type = T.self) -> T?
    where T: PerspectiveReusable {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
      fatalError(
        "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
          + "matching type \(viewType.self). "
          + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
          + "and that you registered the header/footer beforehand"
      )
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
        
    return view
  }
    
}

open class PerspectiveNiblessView: UIView {
    
    func oneCheck() -> Int{
    var checkOne = 93 + 3 * 2
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
  public init() {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    super.init(frame: .zero)
  }
    
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("Init is not implemented")
  }
    
}

