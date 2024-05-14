//
//  ActualChecklistChecker.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 26.04.2024.
//

import SwiftUI

class ActualChecklistChecker: UIControl {
    var isOn: Bool = false {
        
        didSet {
           actualToggleSwitch(animated: true)
        }
    }
    
   
    private let switchThumb = UIView()
    private let onBackgroundColor = UIColor(named: "toggleOn" )
    private let offBackgroundColor = UIColor.white.withAlphaComponent(0.05)
    private let thumbColor = UIColor.white

    override init(frame: CGRect) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.init(frame: frame)
        actualSetupViews()
    }

    required init?(coder: NSCoder) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fatalError("init(coder:) has not been implemented")
    }
    
    private func actualSetupViews() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        self.backgroundColor = offBackgroundColor
        self.layer.cornerRadius = frame.height / 2
        self.clipsToBounds = true
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        switchThumb.backgroundColor = thumbColor
        switchThumb.layer.cornerRadius = (frame.height - 4) / 2 // Subtracting 4 to have some padding
        addSubview(switchThumb)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        actualUpdateSwitchThumbPosition(animated: false)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actualToggleSwitchAction)))
    }
    override func layoutSubviews() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
            super.layoutSubviews()
            self.layer.cornerRadius = self.bounds.height / 2
            switchThumb.layer.cornerRadius = (self.bounds.height - 4) / 2
            actualUpdateSwitchThumbPosition(animated: false)
        }
    
    @objc private func actualToggleSwitchAction() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        isOn = !isOn
        sendActions(for: .valueChanged)
    }

    private func actualUpdateSwitchThumbPosition(animated: Bool) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let thumbFrame = CGRect(x: isOn ? frame.width - frame.height + 2 : 2,
                                y: 2,
                                width: frame.height - 4,
                                height: frame.height - 4)
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.switchThumb.frame = thumbFrame
                self.backgroundColor = self.isOn ? self.onBackgroundColor : self.offBackgroundColor
            }
        } else {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            switchThumb.frame = thumbFrame
            backgroundColor = isOn ? onBackgroundColor : offBackgroundColor
        }
    }
    
    
    
    
    
    
    
    private func actualToggleSwitch(animated: Bool) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        actualUpdateSwitchThumbPosition(animated: animated)
    }
    
    
}
