//
//  ActualAllertManager.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 29.04.2024.
//

import UIKit

class ActualAlertManager {
    static let shared = ActualAlertManager()
    private init() {}

    var alertViewController: ActualAllertController?

    func actualShowAlert() {
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        alertViewController?.actualBackgroundAlertView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.alertViewController?.actualCustomAlert(alertType: .download)
        }
    }
    
    func actualStopAlerts() {
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        self.alertViewController?.shouldDisplayAlerts = false
    }
}
