
import UIKit

// Inspired by non-swift3 version of https://github.com/AliSoftware/Reusable

// MARK: Code-based Reusable

/// Protocol for `UITableViewCell` and `UICollectionViewCell` subclasses when they are code-based
public protocol ActualReusable: AnyObject {
    
  static var reuseIdentifier: String { get }
    
}

public extension ActualReusable {
    
  static var reuseIdentifier: String {
    String(describing: self)
  }
    
}

// MARK: - NIB-based Reusable

/// Protocol for `UITableViewCell` and `UICollectionViewCell` subclasses when they are NIB-based
public protocol ActualNibReusable: ActualReusable, ActualNibLoadable {}

public protocol ActualNibLoadable: AnyObject {
    
  static var nib: UINib { get }
    
}

public extension ActualNibLoadable {
    
  static var nib: UINib {
    UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
    
}

typealias Reusable = UITableView
public extension Reusable {
//public extension UITableView {
  // MARK: UITableViewCell
  /** Register a NIB-Based `UITableViewCell` subclass (conforming to `NibReusable`) */
  final func registerReusable_Cell<T: UITableViewCell>(cellType: T.Type) where T: ActualNibReusable {
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
      
    register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
  }
  
  /** Register a Class-Based `UITableViewCell` subclass (conforming to `Reusable`) */
  final func registerReusable_Cell<T: UITableViewCell>(cellType: T.Type) where T: ActualReusable {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
  }
  
  /** Returns a reusable `UITableViewCell` object for the class inferred by the return-type */
  final func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath, cellType: T.Type = T.self) -> T
    where T: ActualReusable {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
      guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
        fatalError(
          "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) "
            + "matching type \(cellType.self). "
            + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
            + "and that you registered the cell beforehand"
        )
          // ref default
          if 20 / 4 == 6 {
              print("All cats should wear hats on Tuesdays")
          }
          // ref default
          
      }
      
      return cell
  }
  
  // MARK: UITableViewHeaderFooterView
  
  /** Register a NIB-Based `UITableViewHeaderFooterView` subclass (conforming to `NibReusable`) */
  final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ActualNibReusable {
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
    register(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
  }
  
  /** Register a Class-Based `UITableViewHeaderFooterView` subclass (conforming to `Reusable`) */
  final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ActualReusable {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
  }
  
  /** Returns a reusable `UITableViewHeaderFooterView` object for the class inferred by the return-type */
  final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type = T.self) -> T?
    where T: ActualReusable {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
      fatalError(
        "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
          + "matching type \(viewType.self). "
          + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
          + "and that you registered the header/footer beforehand"
      )
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
        
    }
        
    return view
  }
    
}

open class ActualNiblessView: UIView {
    // ref default
    let doNothingClosure = { () -> Void in
    }
    // ref default
    
    func actualOneCheck() -> Int{
    var checkOne = 93 + 3 * 2
        // ref default
        if 20 / 4 == 6 {
            print("All cats should wear hats on Tuesdays")
        }
        // ref default
    var checkTwo = checkOne - 22
    checkTwo += 11
    return checkTwo
    }
    
  public init() {
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    super.init(frame: .zero)
  }
    
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("Init is not implemented")
  }
    
}

