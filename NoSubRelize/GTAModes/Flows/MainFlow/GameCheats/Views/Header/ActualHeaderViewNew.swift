//
//  GameModesHeaderView_New.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 26.02.2024.
//

import Foundation
import UIKit

final class ActualHeaderViewNew: UICollectionReusableView {
    
    public var actionButton: ((Int) -> ())?
    
    private let stackView: UIStackView = {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var selectedButton: UIButton?
    
    override init(frame: CGRect) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.init(frame: frame)
        
        gtavk_setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func gtavk_setupView() {
        self.addSubview(stackView) // В UICollectionReusableView нет contentView, так что добавляем прямо в self.
        stackView.layer.cornerRadius = 18
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.withBorder(width: 1, color: (UIColor(named: "ActualPink")?.withAlphaComponent(0.4))!)
        stackView.clipsToBounds = true
        stackView.actualLayout {
            $0.leading.equal(to: self.leadingAnchor, offsetBy: 0)
            $0.trailing.equal(to: self.trailingAnchor, offsetBy: 0)
            $0.top.equal(to: self.topAnchor, offsetBy: 00.0)
            $0.bottom.equal(to: self.bottomAnchor)
        }
        
        let images = ["sony", "xbox", "win", "fav"]
        for imageName in images {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageView?.clipsToBounds = true
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            button.withBorder(width: 1, color: (UIColor(named: "ActualPink")?.withAlphaComponent(0.4))!)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(actualButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            if imageName == "sony" {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                button.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
                selectedButton = button
            } else {
                button.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(1.0)
            }
            
            button.actualLayout {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
                $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 121 : 79)
                $0.width.equal(to: 88.0)
            }
        }
    }
    
    @objc func actualButtonTapped(sender: UIButton) {
        if let index = stackView.arrangedSubviews.firstIndex(of: sender) {
            actionButton?(index)
            if let selectedButton = selectedButton {
                selectedButton.backgroundColor = UIColor(named: "ActualBlack")
            }
            selectedButton = sender
            sender.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
        }
    }
}



/*
final class PerspectiveHeaderViewNew: UITableViewHeaderFooterView, ActualReusable {
    
    public var actionButton: ((Int) -> ())?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var selectedButton: UIButton?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        gtavk_setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func gtavk_setupView() {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        contentView.addSubview(stackView)
        stackView.layer.cornerRadius = 18
        stackView.withBorder(width: 1, color: (UIColor(named: "ActualPink")?.withAlphaComponent(0.4))!)
        stackView.clipsToBounds = true
        stackView.actualLayout {
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
            $0.top.equal(to: contentView.topAnchor, offsetBy: 00.0)
           // $0.bottom.equal(to: contentView.bottomAnchor)
        }
        let images = ["sony", "xbox", "win", "fav"]
        for imageName in images {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageView?.clipsToBounds = true
           // button.withBorder(1)
            button.withBorder(width: 1, color: (UIColor(named: "ActualPink")?.withAlphaComponent(0.4))!)
            button.withCornerRadius(0.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(actualButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            if imageName == "sony" {
                button.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
                selectedButton = button
            } else {
                button.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(1.0)
            }
            
            button.perspectiveLayout {
                $0.height.equal(to: 79.0)
                $0.width.equal(to: 88.0)
            }
        }
    }
    
    @objc func perspectiveButtonTapped(sender: UIButton) {
        if let index = stackView.arrangedSubviews.firstIndex(of: sender) {
            actionButton?(index)
            if let selectedButton = selectedButton {
                selectedButton.backgroundColor = UIColor(named: "ActualBlack")
            }
            selectedButton = sender
            sender.backgroundColor = UIColor(named: "ActualPink")?.withAlphaComponent(1.0)
        }
    }
}
*/
