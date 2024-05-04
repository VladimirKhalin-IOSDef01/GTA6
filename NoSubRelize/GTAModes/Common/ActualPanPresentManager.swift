
import UIKit

final class ActualPanPresentManager: NSObject, UIViewControllerTransitioningDelegate {
  
  func presentationController(
    forPresented presented: UIViewController,
    presenting: UIViewController?,
    source: UIViewController
  ) -> UIPresentationController? {
      
    let presentationController = ActualPPControllerPresent(presented: presented, presenting: presenting)
    return presentationController
  }
  
}

typealias PPresentManager = UIViewController
public extension PPresentManager {
//public extension UIViewController {
  private static var presentationManagerKey: UInt8 = 0
  
  private var perspectivePresentationManager: UIViewControllerTransitioningDelegate? {
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
    return newManager
  }
  
  func perspectivePresentPanCollection(_ controller: UIViewController) {
    controller.modalPresentationStyle = .custom
    controller.transitioningDelegate = perspectivePresentationManager
    present(controller, animated: false, completion: nil)
  }
  
}
