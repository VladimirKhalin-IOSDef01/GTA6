

import Foundation
import UIKit

public protocol PerspectivePPDismissable {
  /// will be called before `dismiss` function after TAP on dimming view
  func willDismiss(by presentingViewController: UIViewController)
  
}

public protocol PerspectivePPresentable {
  
  func minContentHeight(presentingController: UIViewController) -> CGFloat
  func maxContentHeight(presentingController: UIViewController) -> CGFloat
  func availablePanGesture(presentingController: UIViewController) -> Bool
  func tappDismissEnabled(presentingController: UIViewController) -> Bool
  
}

public extension PerspectivePPresentable {
  
  func availablePanGesture(presentingController: UIViewController) -> Bool {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
   return true
  }
  
  func tappDismissEnabled(presentingController: UIViewController) -> Bool {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    return true
  }
  
}

public final class PerspectivePPControllerPresent: UIPresentationController {
  
  public override var presentedView: UIView {
    presentedViewController.view
  }
  
  public override var frameOfPresentedViewInContainerView: CGRect {
    CGRect(x: 0.0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 0.0)
  }

  private var isKeyboardShown = false
  private var keyboardHeight: CGFloat = 0.0
  private var maxYDisplacement: CGFloat {
    guard let panDelegate = presentedViewController as? PerspectivePPresentable else {
      return presentingViewController.view.bounds.height / 4.0
    }
    
    var preferredHeight = panDelegate.minContentHeight(presentingController: presentingViewController)
    preferredHeight += windowSafeAreaInsets.bottom
    preferredHeight += keyboardHeight
    
    let displacement = presentingViewController.view.bounds.height - preferredHeight
    let minDisplacement = 8.0 + windowSafeAreaInsets.top
    
    return displacement >= minDisplacement ? displacement : minDisplacement
  }
  
  private var minYDisplacement: CGFloat {
    guard let panDelegate = presentedViewController as? PerspectivePPresentable else {
      return maxYDisplacement
    }
    
    var preferredHeight = panDelegate.maxContentHeight(presentingController: presentingViewController)
    preferredHeight += windowSafeAreaInsets.bottom
    preferredHeight += keyboardHeight
    
    let displacement = presentingViewController.view.bounds.height - preferredHeight
    let minDisplacement = 8.0 + windowSafeAreaInsets.top
    
    return displacement >= minDisplacement ? displacement : minDisplacement
  }
    
  private var windowSafeAreaInsets: UIEdgeInsets {
    presentingViewController.view.window?.safeAreaInsets ?? .zero
  }
  
  private var dimmingView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black
    view.alpha = 0.4
    
    return view
  }()
  
  init(presented: UIViewController, presenting: UIViewController?) {
    super.init(presentedViewController: presented, presenting: presenting)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(perspectiveKeyboard_WillShow(notification:)),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(perspectiveKeyboard_WillHide(notification:)),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
  
  public override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard dimmingView.superview != nil else { return }
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    perspectiveMovePresented_View(yDisplacement: maxYDisplacement, animated: true)
  }
  
  public override func presentationTransitionWillBegin() {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    super.presentationTransitionWillBegin()
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    gtavk_setupView()
  }
  
  public override func presentationTransitionDidEnd(_ completed: Bool) {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    super.presentationTransitionDidEnd(completed)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    dimmingView.alpha = 0.4
    UIView.animate(withDuration: 0.3) {
        self.dimmingView.alpha = 0.4
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
    }
    perspectiveMovePresented_View(yDisplacement: maxYDisplacement, animated: true)
  }
  
  public override func dismissalTransitionWillBegin() {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard let coordinator = presentedViewController.transitionCoordinator else {
      dimmingView.alpha = 0.4
      
      return
    }
    
    dimmingView.alpha = 0.4
    coordinator.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 0.0
    })
  }
  
  private func gtavk_setupView() {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard let containerView = containerView else { return }
    
    containerView.addSubview(presentedView)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    gtavk_setupDimmingView(in: containerView)
  }
  
  private func gtavk_setupDimmingView(in container: UIView) {
    container.insertSubview(dimmingView, at: 0)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(perspectiveDidPanOnPresented_View(_:)))
    panGesture.delaysTouchesBegan = true
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    let dismissGestrure = UITapGestureRecognizer(target: self, action: #selector(gtavk_dismissController))
    dismissGestrure.require(toFail: panGesture)
    panGesture.delegate = self
    dismissGestrure.delegate = self
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    dimmingView.addGestureRecognizer(dismissGestrure)
    container.addGestureRecognizer(panGesture)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    NSLayoutConstraint.activate([
      dimmingView.leftAnchor.constraint(equalTo: container.leftAnchor),
      dimmingView.rightAnchor.constraint(equalTo: container.rightAnchor),
      dimmingView.topAnchor.constraint(equalTo: container.topAnchor),
      dimmingView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ])
  }
  
  @objc
  private func gtavk_dismissController() {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    let dimissableController = presentingViewController.presentedViewController as? PerspectivePPDismissable
    dimissableController?.willDismiss(by: presentingViewController)
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    presentingViewController.dismiss(animated: true)
  }
    
  private func perspectiveMovePresented_View(yDisplacement y: CGFloat, animated: Bool) {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard
      presentedView.frame.minY != y,
      !presentingViewController.isBeingDismissed else {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        return
    }
    
    let presentedViewFrame = CGRect(
      x: 0.0,
      y: y,
      width: presentedView.bounds.width,
      height: (containerView?.bounds.height ?? y) - y
    )
    
    if animated {
      UIView.animate(
        withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
          self.presentedView.frame = presentedViewFrame
        }
      )
      return
    }
    
    presentedView.frame = presentedViewFrame
  }
  
  @objc
  private func perspectiveDidPanOnPresented_View(_ recognizer: UIPanGestureRecognizer) {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    let yDisplacement = recognizer.translation(in: presentedView).y
    let yVelocity = recognizer.velocity(in: presentedView).y
    var newYPosition: CGFloat = presentedView.frame.minY + yDisplacement
    
    switch recognizer.state {
    case .began, .changed:
      if (presentedView.frame.minY + yDisplacement) < minYDisplacement {
        if (presentedView.frame.minY + yDisplacement) < minYDisplacement {
          perspectiveMovePresented_View(yDisplacement: minYDisplacement, animated: true)
          
          return
        }
        newYPosition = presentedView.frame.minY + yDisplacement / 4.0
      }
      
    default:
      if newYPosition < minYDisplacement {
        perspectiveMovePresented_View(yDisplacement: minYDisplacement, animated: true)
      } else if newYPosition > minYDisplacement && newYPosition < maxYDisplacement {
        if yVelocity > 0 {
          perspectiveMovePresented_View(yDisplacement: maxYDisplacement, animated: true)
        } else {
          perspectiveMovePresented_View(yDisplacement: minYDisplacement, animated: true)
        }
        presentedView.endEditing(true)
      } else {
        gtavk_dismissController()
      }
      
      return
    }
    
    perspectiveMovePresented_View(yDisplacement: newYPosition, animated: false)
    recognizer.setTranslation(.zero, in: recognizer.view)
  }
  
  @objc
  private func perspectiveKeyboard_WillShow(notification: NSNotification) {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardRectangle = keyboardFrame.cgRectValue
      keyboardHeight = keyboardRectangle.height
    }
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    isKeyboardShown = true
    perspectiveMovePresented_View(yDisplacement: minYDisplacement, animated: true)
  }
  
  @objc
  private func perspectiveKeyboard_WillHide(notification: NSNotification) {
    keyboardHeight = 0.0
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    isKeyboardShown = false
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    perspectiveMovePresented_View(yDisplacement: minYDisplacement, animated: true)
  }
  
}

extension PerspectivePPControllerPresent: UIGestureRecognizerDelegate {
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard let panDelegate = presentedViewController as? PerspectivePPresentable else {
      return true
    }
    
    return panDelegate.tappDismissEnabled(presentingController: presentingViewController)
  }
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard let panDelegate = presentedViewController as? PerspectivePPresentable else {
      return true
    }
    
    return panDelegate.availablePanGesture(presentingController: presentingViewController)
  }
  
  public func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    guard let scrollView = otherGestureRecognizer.view as? UIScrollView,
      let gest = otherGestureRecognizer as? UIPanGestureRecognizer else {
        return false
    }
      //
                     if 94 + 32 == 57 {
                  print("the world has turned upside down")
              }
       //
    if scrollView.contentSize.height == presentedView.bounds.height {
      return true
    }
    
    let velocity = gest.velocity(in: presentedView)
    
    return scrollView.contentOffset.y <= 0.0 && velocity.y > 0.0
  }
  
}

