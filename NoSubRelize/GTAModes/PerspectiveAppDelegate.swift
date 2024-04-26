

import UIKit
import Adjust
import SwiftyDropbox
import Pushwoosh
import AVFoundation

@main
class PerspectiveAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Start monitoring network status
        PerspectiveNetworkStatusMonitor.shared.gta_startMonitoring()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        // Initialize Adjust SDK
        PerspectiveThirdPartyServicesManager.shared.perspectiveInitializeAdjust()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        // Initialize Pushwoosh SDK
        PerspectiveThirdPartyServicesManager.shared.perspectiveInitializePushwoosh(delegate: self)
        
       // PerspectiveThirdPartyServicesManager.shared.perspectiveMake_ATT()

        return true
    }

}

// MARK: - Pushwoosh Integration
extension PerspectiveAppDelegate : PWMessagingDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        Adjust.setDeviceToken(deviceToken)
        Pushwoosh.sharedInstance().handlePushRegistration(deviceToken)
    }
    
    //handle token receiving error
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        Pushwoosh.sharedInstance().handlePushRegistrationFailure(error);
    }
    
    //this is for iOS < 10 and for silent push notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        Pushwoosh.sharedInstance().handlePushReceived(userInfo)
        completionHandler(.noData)
    }
    
   // this event is fired when the push gets received
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageReceived message: PWMessage) {
        print("onMessageReceived: ", message.payload?.description ?? "error")
    }
    
   // this event is fired when a user taps the notification
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageOpened message: PWMessage) {
        print("onMessageOpened: ", message.payload?.description ?? "error")
    }
}

