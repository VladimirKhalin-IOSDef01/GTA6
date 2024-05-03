
import UIKit

final class PerspectivePanPresentManager: NSObject, UIViewControllerTransitioningDelegate {
  
  func presentationController(
    forPresented presented: UIViewController,
    presenting: UIViewController?,
    source: UIViewController
  ) -> UIPresentationController? {
      
    let presentationController = PerspectivePPControllerPresent(presented: presented, presenting: presenting)
    return presentationController
  }
  
}

typealias PPresentManager = UIViewController
public extension PPresentManager {
//public extension UIViewController {
  private static var presentationManagerKey: UInt8 = 0
  
  private var perspectivePresentationManager: UIViewControllerTransitioningDelegate? {
    if let manager = objc_getAssociatedObject(self, &UIViewController.presentationManagerKey)
        as? PerspectivePanPresentManager {
      return manager
    }
    
    let newManager = PerspectivePanPresentManager()
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
