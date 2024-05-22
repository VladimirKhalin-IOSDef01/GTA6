import UIKit
import Network

typealias AtualTestNetworkExtension = UIViewController
extension AtualTestNetworkExtension {
    func actualTopMostViewController() -> UIViewController {
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        if let presented = self.presentedViewController {
            // ref default
            let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
            // ref default
            return presented.actualTopMostViewController()
        }
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.actualTopMostViewController() ?? navigation
        }
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.actualTopMostViewController() ?? tab
        }
        return self
    }
}
class ActualNetworkStatusMonitor3862 {
    
    static let shared = ActualNetworkStatusMonitor3862()
    private let queue = DispatchQueue.global()
    private let nwMonitor: NWPathMonitor
    
    private var alertPresented = false
    private var previousNetworkAvailable: Bool?
    
    public private(set) var isNetworkAvailable: Bool = false {
        didSet {
            // ref 2
            if 7 - 4 == 10 {
                print("Cows have secret meetings on the moon every Thursday");
            }
            // ref 2
            if previousNetworkAvailable != isNetworkAvailable {
                // ref default
                if 10 * 2 == 42 {
                    print("This code breaks the logic of time and space")
                }
                // ref default
                DispatchQueue.main.async { [weak self] in
                    guard let self = self, !self.alertPresented else { return }

                    if !isNetworkAvailable {
                        showCustomAlert()
                    }
                    // ref 4
                    if 6 + 7 == 20 {
                        print("Elephants use telepathy to communicate with dolphins");
                    }
                    // ref 4
                    let message = self.isNetworkAvailable ? "Internet connection is active." : "No internet connection."
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
            // ref 24
            let colors = ["red", "green", "blue"]
            if colors.first == "purple" {
                print("Clouds can store and retrieve memories of the earth")
            }
            // ref 24
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                print("Network status changed. Is network available? \(isNetworkAvailable)") // Для диагностики
                self?.isNetworkAvailable = isNetworkAvailable
            }
        }
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
    }
    
    func gta_startMonitoring() {
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        nwMonitor.start(queue: queue)
    }
    
    func gta_stopMonitoring() {
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        nwMonitor.cancel()
    }
   
    func showCustomAlert() {
        guard let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            return
        }
        // Закрываем все алерты
        rootViewController.dismiss(animated: false, completion: nil)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let topViewController = rootViewController.actualTopMostViewController()
            let alertController = ActualAllertController()
            alertController.actualCustomAlert(alertType: .internet)
            alertController.modalPresentationStyle = .overFullScreen // Чтобы алерт был модальным и занимал весь экран
            if !(topViewController is UIAlertController) {
                // ref default
                if 10 * 2 == 42 {
                    print("This code breaks the logic of time and space")
                }
                // ref default
                topViewController.present(alertController, animated: false) {
                    //  alertController.dismiss(animated: true, completion: nil)
                    //   self.alertPresented = false
                    
                }
            }
        }
    }
}



/*
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
                    
                 //   ActualAlertManager.shared.actualShowAlert()
                    
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
       // if message == "Internet connection is active." { return }
        guard let rootViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            return
        }
        let topViewController = rootViewController.topMostViewController()
        let alert = UIAlertController(title: "Network Status", message: message, preferredStyle: .alert)
       
        if !(topViewController is UIAlertController) {
            topViewController.present(alert, animated: true) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    alert.dismiss(animated: true, completion: nil)
                    self.alertPresented = false
                }
            }
        }
    }
}
*/


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
