//
//  FilterTableViewCell.swift
//  GTAModes
//
//  Created by Максим Педько on 31.07.2023.
//

import Foundation
import UIKit

final class PerspectiveFilterTabViewCell: UITableViewCell, PerspectiveReusable {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let checkImage = UIImageView()
    private let borderLineView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        perspectiveSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func perspectiveConfigure_cell(_ value: perspectiveFilter_Data) {
        titleLabel.font = UIFont(name: "Gilroy-Regular", size: 20)
        titleLabel.textColor = .white
        titleLabel.text = value.title.capitalized(with: .autoupdatingCurrent)
        checkImage.isHidden = !value.isCheck
    }
    
    private func perspectiveSetupLayout() {
       
       // contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
       // containerView.backgroundColor = .clear
        
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor)
            $0.leading.equal(to: contentView.leadingAnchor)
            $0.trailing.equal(to: contentView.trailingAnchor)
        }
        containerView.addSubview(checkImage)
        checkImage.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -20.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 24.0)
            $0.width.equal(to: 24.0)
        }
        checkImage.image = .init(named: "checkIcon")
        
        containerView.addSubview(titleLabel)
        titleLabel.perspectiveLayout {
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 16.0)
            $0.trailing.equal(to: checkImage.leadingAnchor, offsetBy: -4.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
        }
        containerView.addSubview(borderLineView)
        borderLineView.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -20)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 20.0)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.height.equal(to: 2.0)
        }
       //borderLineView.backgroundColor = .init(named: "cellLineColor")
        borderLineView.backgroundColor = .white.withAlphaComponent(0.2)
    }
    
}


