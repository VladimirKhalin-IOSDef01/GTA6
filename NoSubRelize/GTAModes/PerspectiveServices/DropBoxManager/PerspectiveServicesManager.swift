

import Foundation
import UIKit
import Adjust
import Pushwoosh
import AppTrackingTransparency
import AdSupport

class PerspectiveThirdPartyServicesManager {
    
    static let shared = PerspectiveThirdPartyServicesManager()

    
    func perspectiveInitializePushwoosh(delegate: PWMessagingDelegate) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //set custom delegate for push handling, in our case AppDelegate
        Pushwoosh.sharedInstance().delegate = delegate;
        PushNotificationManager.initialize(withAppCode: PerspectiveConfiguration.pushwooshToken, appName: PerspectiveConfiguration.pushwooshAppName)
        PWInAppManager.shared().resetBusinessCasesFrequencyCapping()
        PWGDPRManager.shared().showGDPRDeletionUI()
        Pushwoosh.sharedInstance().registerForPushNotifications()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
  
    
    func perspectiveInitializeAdjust() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        let yourAppToken = PerspectiveConfiguration.adjustToken
        #if DEBUG
        let environment = (ADJEnvironmentSandbox as? String)!
        #else
        let environment = (ADJEnvironmentProduction as? String)!
        #endif
        let adjustConfig = ADJConfig(appToken: yourAppToken, environment: environment)
        
        adjustConfig?.logLevel = ADJLogLevelVerbose
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        Adjust.appDidLaunch(adjustConfig)
    }
    
    func perspectiveMake_ATT() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization { status in
                    switch status {
                    case .authorized:
                        print("Authorized")
                        let idfa = ASIdentifierManager.shared().advertisingIdentifier
                        print("Пользователь разрешил доступ. IDFA: ", idfa)
                        //
                        if 94 + 32 == 57 {
                            print("the world has turned upside down")
                        }
                        //
                        let authorizationStatus = Adjust.appTrackingAuthorizationStatus()
                        Adjust.updateConversionValue(Int(authorizationStatus))
                        Adjust.checkForNewAttStatus()
                        print(ASIdentifierManager.shared().advertisingIdentifier)
                    case .denied:
                        print("Denied")
                    case .notDetermined:
                        print("Not Determined")
                        self.perspectiveMake_ATT()
                    case .restricted:
                        print("Restricted")
                    @unknown default:
                        print("Unknown")
                    }
                }
            }
        }
    }
}

