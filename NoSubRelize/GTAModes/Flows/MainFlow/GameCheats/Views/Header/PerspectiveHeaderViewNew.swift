//
//  GameModesHeaderView_New.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 26.02.2024.
//

import Foundation
import UIKit

final class PerspectiveHeaderViewNew: UITableViewHeaderFooterView, PerspectiveReusable {
    
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
        stackView.perspectiveLayout {
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
            button.addTarget(self, action: #selector(perspectiveButtonTapped), for: .touchUpInside)
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
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
