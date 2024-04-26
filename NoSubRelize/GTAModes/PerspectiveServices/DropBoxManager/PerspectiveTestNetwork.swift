import UIKit
import Network

typealias TestNetworkExtension = UIViewController
extension TestNetworkExtension {
    func topMostViewController() -> UIViewController {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        return self
    }
}

class PerspectiveNetworkStatusMonitor {
    static let shared = PerspectiveNetworkStatusMonitor()
    private let queue = DispatchQueue.global()
    private let nwMonitor: NWPathMonitor
    
    private var alertPresented = false
    private var previousNetworkAvailable: Bool?
    
    public private(set) var isNetworkAvailable: Bool = false {
        didSet {
            if previousNetworkAvailable != isNetworkAvailable {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self, !self.alertPresented else { return }
                    let message = self.isNetworkAvailable ? "Internet connection is active." : "No internet connection."
                    self.showAlert(message: message)
                    print(message)
                }
            }
            previousNetworkAvailable = isNetworkAvailable
        }
    }
    
    private init() {
        nwMonitor = NWPathMonitor()
        nwMonitor.pathUpdateHandler = { [weak self] path in
            let isNetworkAvailable = path.status == .satisfied
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                print("Network status changed. Is network available? \(isNetworkAvailable)") // Для диагностики
                self?.isNetworkAvailable = isNetworkAvailable
            }
        }
    }
    
    func gta_startMonitoring() {
        nwMonitor.start(queue: queue)
    }
    
    func gta_stopMonitoring() {
        nwMonitor.cancel()
    }
   
    private func showAlert(message: String) {
        if message == "Internet connection is active." { return }
        guard let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            return
        }
        let topViewController = rootViewController.topMostViewController()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let alert = UIAlertController(title: "Network Status", message: message, preferredStyle: .alert)
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        if !(topViewController is UIAlertController) {
            topViewController.present(alert, animated: true) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    alert.dismiss(animated: true, completion: nil)
                    self.alertPresented = false
                }
            }
        }
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        
    }
}



/*
 didSet {
     // Проверка на изменение состояния сети и на необходимость показа алерта
     if let previous = previousNetworkAvailable, previous != isNetworkAvailable {
         showNetworkChangeAlertIfNeeded()
     } else if previousNetworkAvailable == nil && !isNetworkAvailable {
         // Случай, когда при первой проверке сеть недоступна
         showNetworkChangeAlertIfNeeded()
     }
     previousNetworkAvailable = isNetworkAvailable
 }
 */
