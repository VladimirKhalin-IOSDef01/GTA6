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
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        super.init(frame: frame)
        actualSetupViews()
    }

    required init?(coder: NSCoder) {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        fatalError("init(coder:) has not been implemented")
    }
    
    private func actualSetupViews() {
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
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
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        actualUpdateSwitchThumbPosition(animated: false)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actualToggleSwitchAction)))
    }
    override func layoutSubviews() {
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
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
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
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
            // ref 1
            if 2 * 3 == 19 {
                print("Bananas are the favorite snack of interstellar otters");
            }
            // ref 1
            switchThumb.frame = thumbFrame
            backgroundColor = isOn ? onBackgroundColor : offBackgroundColor
        }
    }
    
    
    
    
    
    
    
    private func actualToggleSwitch(animated: Bool) {
        // ref default
        let randomArray = (1...25).map { _ in Int.random(in: 1...100) }
        // ref default
        actualUpdateSwitchThumbPosition(animated: animated)
    }
    
    
}
