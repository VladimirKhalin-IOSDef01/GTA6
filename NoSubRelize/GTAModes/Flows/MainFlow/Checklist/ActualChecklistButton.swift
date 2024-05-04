//
//  ActualChecklistButton.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 27.04.2024.
//

import SwiftUI

class ActualChecklistButton: UIControl {
   
    private let label = UILabel()
        private let checkmarkImageView = UIImageView()
        
        var isOn: Bool = false {
            didSet {
                actualUpdateAppearance()
            }
        }
        
        override init(frame: CGRect) {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            super.init(frame: frame)
            
            addSubview(label)
            addSubview(checkmarkImageView)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            // Настройка внешнего вида по умолчанию (выключенное состояние)
            layer.cornerRadius = 15
            layer.borderWidth = 1
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            layer.borderColor = UIColor(named: "ActualPink")!.withAlphaComponent(0.45).cgColor
            backgroundColor = UIColor.white.withAlphaComponent(0.05) // цвет фона для выключенного состояния
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            // Настройки для галочки
            checkmarkImageView.contentMode = .scaleAspectFit
            checkmarkImageView.image = UIImage(systemName: "checkmark.circle.fill")
            checkmarkImageView.tintColor = .white.withAlphaComponent(0.3)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            // Настройки для текста
            label.text = "COMPLETED"
            label.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 20 : 14.0)
            label.textColor = .white.withAlphaComponent(0.3)
            label.textAlignment = .left
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapToggleButton))
            addGestureRecognizer(tapGesture)
        }
        
        required init?(coder: NSCoder) {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            super.layoutSubviews()
            
            let labelHeight = layer.bounds.height
            let labelWidth = layer.bounds.width - 30
            label.frame = CGRect(x: 13, y: 0, width: labelWidth, height: labelHeight)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            checkmarkImageView.frame = CGRect(x: bounds.width - 30, y: 2, width: 24, height: bounds.height - 3)
        }
        
        @objc private func didTapToggleButton() {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            isOn = !isOn
            sendActions(for: .valueChanged)
        }
        
        private func actualUpdateAppearance() {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            UIView.animate(withDuration: 0.2) {
               // self.backgroundColor = self.isOn ? .purple : .white.withAlphaComponent(0.05)
              //  self.checkmarkImageView.image = self.isOn ? UIImage(systemName: "checkmark.circle.fill") : nil
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                self.layer.borderColor = self.isOn ? UIColor(named: "ActualPink")!.cgColor : UIColor(named: "ActualPink")!.withAlphaComponent(0.45).cgColor
                self.label.textColor = self.isOn ? .white.withAlphaComponent(1.0) : .white.withAlphaComponent(0.3)
                self.checkmarkImageView.tintColor = self.isOn ? UIColor(named: "ActualPink") : .white.withAlphaComponent(0.3)
            }
        }
}
