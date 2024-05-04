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
        alertViewController?.actualBackgroundAlertView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.alertViewController?.actualCustomAlert(alertType: .download)
        }
    }
    
    func actualStopAlerts() {
        self.alertViewController?.shouldDisplayAlerts = false
    }
}
