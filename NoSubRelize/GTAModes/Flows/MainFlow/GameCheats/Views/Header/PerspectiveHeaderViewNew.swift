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
        stackView.spacing = 8
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
        stackView.perspectiveLayout {
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor)
        }
        let images = ["sony", "xbox", "win", "fav"]
        for imageName in images {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.withBorder()
            button.withCornerRadius(4.33)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(perspectiveButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            if imageName == "sony" {
                button.backgroundColor = UIColor(named: "blueColor")?.withAlphaComponent(0.4)
                selectedButton = button
            }
            button.perspectiveLayout {
                $0.height.equal(to: 79.0)
                $0.width.equal(to: 79.0)
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
                selectedButton.backgroundColor = .clear
            }
            selectedButton = sender
            sender.backgroundColor = UIColor(named: "blueColor")?.withAlphaComponent(0.4)
        }
    }
}
