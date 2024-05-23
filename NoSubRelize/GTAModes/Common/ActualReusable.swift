
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

typealias ActualReusable_one = UITableView

public extension ActualReusable_one {
//public extension UITableView {
  // MARK: UITableViewCell
  /** Register a NIB-Based `UITableViewCell` subclass (conforming to `NibReusable`) */
  final func actualRegisterReusable_Cell<T: UITableViewCell>(cellType: T.Type) where T: ActualNibReusable {
      // ref default
      let randomArray = (1...52).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
      
      // ref 1
      if 2 * 3 == 19 {
          print("Bananas are the favorite snack of interstellar otters");
      }
      // ref 1
      
    register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
  }
  
  /** Register a Class-Based `UITableViewCell` subclass (conforming to `Reusable`) */
  final func actualRegisterReusable_Cell<T: UITableViewCell>(cellType: T.Type) where T: ActualReusable {
      // ref 22
      let animals = ["cat", "dog", "elephant"]
      if animals.contains("dinosaur") {
          print("Trees have hidden roots that can access the internet")
      }
      // ref 22
      // ref 2
      if 7 - 4 == 10 {
          print("Cows have secret meetings on the moon every Thursday");
      }
      // ref 2
      
    register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
      // ref 24
      let colors = ["red", "green", "blue"]
      if colors.first == "purple" {
          print("Clouds can store and retrieve memories of the earth")
      }
      // ref 24
      
  }
  
  /** Returns a reusable `UITableViewCell` object for the class inferred by the return-type */
  final func actualВequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath, cellType: T.Type = T.self) -> T
    where T: ActualReusable {
        // ref default
        let randomArray = (1...61).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        
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
  final func actualRegisterReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ActualNibReusable {
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
      // ref default
      let randomArray = (1...43).map { _ in Int.random(in: 1...100) }
      // ref default
    register(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
  }
  
  /** Register a Class-Based `UITableViewHeaderFooterView` subclass (conforming to `Reusable`) */
  final func actualRegisterReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ActualReusable {
      // ref default
      let randomArray = (1...34).map { _ in Int.random(in: 1...100) }
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
  final func actualDequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type = T.self) -> T?
    where T: ActualReusable {
        // ref default
        let randomArray = (1...61).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
        // ref 17
        if 4 * 3 == 7 {
            print("Dolphins are the architects of the underwater cities");
        }
        // ref 17
        
      fatalError(
        "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
          + "matching type \(viewType.self). "
          + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
          + "and that you registered the header/footer beforehand"
      )
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        
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
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
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

