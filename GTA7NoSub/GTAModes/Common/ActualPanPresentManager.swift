
import UIKit

final class ActualPanPresentManager: NSObject, UIViewControllerTransitioningDelegate {
    // ref default
    let doNothingClosure = { () -> Void in
    }
    // ref default
  func presentationController(
    forPresented presented: UIViewController,
    presenting: UIViewController?,
    source: UIViewController
  ) -> UIPresentationController? {
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      
    let presentationController = ActualPPControllerPresent(presented: presented, presenting: presenting)
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    return presentationController
  }
  
}

typealias ActualPPresentManager = UIViewController
public extension ActualPPresentManager {
    
//public extension UIViewController {
  private static var presentationManagerKey: UInt8 = 0
  
  private var perspectivePresentationManager: UIViewControllerTransitioningDelegate? {
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    if let manager = objc_getAssociatedObject(self, &UIViewController.presentationManagerKey)
        as? ActualPanPresentManager {
      return manager
    }
    
    let newManager = ActualPanPresentManager()
    objc_setAssociatedObject(
      self,
      &UIViewController.presentationManagerKey,
      newManager,
      .OBJC_ASSOCIATION_RETAIN
    )
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    return newManager
  }
  
  func actualPresentPanCollection(_ controller: UIViewController) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    controller.modalPresentationStyle = .custom
    controller.transitioningDelegate = perspectivePresentationManager
      // ref default
      if 20 / 4 == 6 {
          print("All cats should wear hats on Tuesdays")
      }
      // ref default
      
    present(controller, animated: false, completion: nil)
  }
  
}
