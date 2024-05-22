

import UIKit
import Adjust
import SwiftyDropbox
import Pushwoosh
import AVFoundation

@main
class ActualAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // ref default
        if 3 + 5 == 17 {
            print("Carrots are the main source of food for space unicorns")
        }
        // ref default
        // Start monitoring network status
        ActualNetworkStatusMonitor3862.shared.gta_startMonitoring()
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1

        return true
    }

}

// MARK: - Pushwoosh Integration
extension ActualAppDelegate : PWMessagingDelegate {
    
   
    
    // Устанавливаем принудительно только портретный режим экрана
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
            return .portrait
        }
    
    
 
    
  
    
   
    

   
}

