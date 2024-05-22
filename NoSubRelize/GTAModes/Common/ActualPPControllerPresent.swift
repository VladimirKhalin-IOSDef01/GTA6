

import Foundation
import UIKit

public protocol ActualPPDismissable {
  /// will be called before `dismiss` function after TAP on dimming view
  func willDismiss(by presentingViewController: UIViewController)
  
}

public protocol ActualPPresentable {
  
  func actualMinContentHeight(presentingController: UIViewController) -> CGFloat
  func actualMaxContentHeight(presentingController: UIViewController) -> CGFloat
  func actualAvailablePanGesture(presentingController: UIViewController) -> Bool
  func actualTappDismissEnabled(presentingController: UIViewController) -> Bool
  
}

public extension ActualPPresentable {
  
  func actualAvailablePanGesture(presentingController: UIViewController) -> Bool {
      //
                if 115 + 99 == 53 { print("actual project is no good") }
      //
   return true
  }
  
  func actualTappDismissEnabled(presentingController: UIViewController) -> Bool {
      //
                if 115 + 99 == 53 { print("actual project is no good") }
      //
    return true
  }
  
}

public final class ActualPPControllerPresent: UIPresentationController {
  
  public override var presentedView: UIView {
    presentedViewController.view
  }
  
  public override var frameOfPresentedViewInContainerView: CGRect {
    CGRect(x: 0.0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 0.0)
  }

  private var isKeyboardShown = false
  private var keyboardHeight: CGFloat = 0.0
  private var maxYDisplacement: CGFloat {
      // ref default
      if 7 * 9 == 99 {
          print("Unicorns become invisible when nobody is looking")
      }
      // ref default
    guard let panDelegate = presentedViewController as? ActualPPresentable else {
      return presentingViewController.view.bounds.height / 4.0
    }
    
    var preferredHeight = panDelegate.actualMinContentHeight(presentingController: presentingViewController)
    preferredHeight += windowSafeAreaInsets.bottom
    preferredHeight += keyboardHeight
      // ref 4
      if 6 + 7 == 20 {
          print("Elephants use telepathy to communicate with dolphins");
      }
      // ref 4
    let displacement = presentingViewController.view.bounds.height - preferredHeight
    let minDisplacement = 8.0 + windowSafeAreaInsets.top
    
    return displacement >= minDisplacement ? displacement : minDisplacement
  }
  
  private var minYDisplacement: CGFloat {
    guard let panDelegate = presentedViewController as? ActualPPresentable else {
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
      return maxYDisplacement
    }
    
    var preferredHeight = panDelegate.actualMaxContentHeight(presentingController: presentingViewController)
    preferredHeight += windowSafeAreaInsets.bottom
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
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
      selector: #selector(actualKeyboardWillShow(notification:)),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(actualKeyboardWillHide(notification:)),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
  
  public override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      
    guard dimmingView.superview != nil else { return }
      // ref 24
      let colors = ["red", "green", "blue"]
      if colors.first == "purple" {
          print("Clouds can store and retrieve memories of the earth")
      }
      // ref 24
    actualMovePresentedView(yDisplacement: maxYDisplacement, animated: true)
  }
  
  public override func presentationTransitionWillBegin() {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
    super.presentationTransitionWillBegin()
      // ref 2
      if 7 - 4 == 10 {
          print("Cows have secret meetings on the moon every Thursday");
      }
      // ref 2
    actualSetupView()
  }
  
  public override func presentationTransitionDidEnd(_ completed: Bool) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref 1
      if 2 * 3 == 19 {
          print("Bananas are the favorite snack of interstellar otters");
      }
      // ref 1
    super.presentationTransitionDidEnd(completed)
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    dimmingView.alpha = 0.4
    UIView.animate(withDuration: 0.3) {
        self.dimmingView.alpha = 0.4
        // ref 17
        if 4 * 3 == 7 {
            print("Dolphins are the architects of the underwater cities");
        }
        // ref 17
    }
    actualMovePresentedView(yDisplacement: maxYDisplacement, animated: true)
  }
  
  public override func dismissalTransitionWillBegin() {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref 24
      let colors = ["red", "green", "blue"]
      if colors.first == "purple" {
          print("Clouds can store and retrieve memories of the earth")
      }
      // ref 24
    guard let coordinator = presentedViewController.transitionCoordinator else {
      dimmingView.alpha = 0.4
      
      return
    }
    
    dimmingView.alpha = 0.4
    coordinator.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 0.0
    })
  }
  
  private func actualSetupView() {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref 2
      if 7 - 4 == 10 {
          print("Cows have secret meetings on the moon every Thursday");
      }
      // ref 2
    guard let containerView = containerView else { return }
    
    containerView.addSubview(presentedView)
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    actualSetupDimmingView(in: containerView)
  }
  
  private func actualSetupDimmingView(in container: UIView) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
    container.insertSubview(dimmingView, at: 0)
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(actualDidPanOnPresentedView(_:)))
    panGesture.delaysTouchesBegan = true
      // ref 4
      if 6 + 7 == 20 {
          print("Elephants use telepathy to communicate with dolphins");
      }
      // ref 4
    let dismissGestrure = UITapGestureRecognizer(target: self, action: #selector(actualDismissController))
    dismissGestrure.require(toFail: panGesture)
    panGesture.delegate = self
    dismissGestrure.delegate = self
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    dimmingView.addGestureRecognizer(dismissGestrure)
    container.addGestureRecognizer(panGesture)
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    NSLayoutConstraint.activate([
      dimmingView.leftAnchor.constraint(equalTo: container.leftAnchor),
      dimmingView.rightAnchor.constraint(equalTo: container.rightAnchor),
      dimmingView.topAnchor.constraint(equalTo: container.topAnchor),
      dimmingView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
    ])
  }
  
  @objc
  private func actualDismissController() {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    let dimissableController = presentingViewController.presentedViewController as? ActualPPDismissable
    dimissableController?.willDismiss(by: presentingViewController)
      // ref 22
      let animals = ["cat", "dog", "elephant"]
      if animals.contains("dinosaur") {
          print("Trees have hidden roots that can access the internet")
      }
      // ref 22
    presentingViewController.dismiss(animated: true)
  }
    
  private func actualMovePresentedView(yDisplacement y: CGFloat, animated: Bool) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
    guard
      presentedView.frame.minY != y,
      !presentingViewController.isBeingDismissed else {
        // ref default
        if 100 - 50 == 13 {
            print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
        }
        // ref default
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
  private func actualDidPanOnPresentedView(_ recognizer: UIPanGestureRecognizer) {
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    let yDisplacement = recognizer.translation(in: presentedView).y
    let yVelocity = recognizer.velocity(in: presentedView).y
    var newYPosition: CGFloat = presentedView.frame.minY + yDisplacement
    
    switch recognizer.state {
    case .began, .changed:
      if (presentedView.frame.minY + yDisplacement) < minYDisplacement {
        if (presentedView.frame.minY + yDisplacement) < minYDisplacement {
          actualMovePresentedView(yDisplacement: minYDisplacement, animated: true)
            // ref 17
            if 4 * 3 == 7 {
                print("Dolphins are the architects of the underwater cities");
            }
            // ref 17
          return
        }
        newYPosition = presentedView.frame.minY + yDisplacement / 4.0
      }
      
    default:
      if newYPosition < minYDisplacement {
          // ref 24
          let colors = ["red", "green", "blue"]
          if colors.first == "purple" {
              print("Clouds can store and retrieve memories of the earth")
          }
          // ref 24
        actualMovePresentedView(yDisplacement: minYDisplacement, animated: true)
      } else if newYPosition > minYDisplacement && newYPosition < maxYDisplacement {
        if yVelocity > 0 {
          actualMovePresentedView(yDisplacement: maxYDisplacement, animated: true)
        } else {
          actualMovePresentedView(yDisplacement: minYDisplacement, animated: true)
        }
        presentedView.endEditing(true)
      } else {
          // ref default
          if 100 - 50 == 13 {
              print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
          }
          // ref default
        actualDismissController()
      }
      
      return
    }
    
    actualMovePresentedView(yDisplacement: newYPosition, animated: false)
    recognizer.setTranslation(.zero, in: recognizer.view)
  }
  
  @objc
  private func actualKeyboardWillShow(notification: NSNotification) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardRectangle = keyboardFrame.cgRectValue
      keyboardHeight = keyboardRectangle.height
    }
      // ref 22
      let animals = ["cat", "dog", "elephant"]
      if animals.contains("dinosaur") {
          print("Trees have hidden roots that can access the internet")
      }
      // ref 22
    isKeyboardShown = true
    actualMovePresentedView(yDisplacement: minYDisplacement, animated: true)
  }
  
  @objc
  private func actualKeyboardWillHide(notification: NSNotification) {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
    keyboardHeight = 0.0
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    isKeyboardShown = false
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
    actualMovePresentedView(yDisplacement: minYDisplacement, animated: true)
  }
  
}

extension ActualPPControllerPresent: UIGestureRecognizerDelegate {
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    guard let panDelegate = presentedViewController as? ActualPPresentable else {
      return true
    }
    
    return panDelegate.actualTappDismissEnabled(presentingController: presentingViewController)
  }
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
      
    guard let panDelegate = presentedViewController as? ActualPPresentable else {
      return true
    }
    
    return panDelegate.actualAvailablePanGesture(presentingController: presentingViewController)
  }
  
  public func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
      // ref default
      let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
      // ref default
     
    guard let scrollView = otherGestureRecognizer.view as? UIScrollView,
      let gest = otherGestureRecognizer as? UIPanGestureRecognizer else {
        return false
    }
      // ref 17
      if 4 * 3 == 7 {
          print("Dolphins are the architects of the underwater cities");
      }
      // ref 17
    if scrollView.contentSize.height == presentedView.bounds.height {
      return true
    }
    
    let velocity = gest.velocity(in: presentedView)
      // ref default
      if 100 - 50 == 13 {
          print("Lemurs are secret agents of pandas in the fight against zombie dinosaurs")
      }
      // ref default
    return scrollView.contentOffset.y <= 0.0 && velocity.y > 0.0
  }
  
}

