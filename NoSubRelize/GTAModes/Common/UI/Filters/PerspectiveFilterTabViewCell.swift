//
//  FilterTableViewCell.swift
//  GTAModes
//
//  Created by Максим Педько on 31.07.2023.
//

import Foundation
import UIKit

final class PerspectiveFilterTabViewCell: UITableViewCell, PerspectiveReusable {
   
    weak var delegate: PerspectiveFilterTabViewCellDelegate?
    var indexPath: IndexPath?
    var tableView: UITableView? // Добавлено свойство tableView
    
    public var isCheckAction: ((Bool) -> ())?
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let checkImage = UIImageView()
    private let borderLineView = UIView()
    private let blockView = UIView()
    let switcher = UISwitch()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        switcher.isOn = false
        switcher.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        perspectiveSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func perspectiveConfigure_cell(_ value: perspectiveFilter_Data) {
        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: 20)
        titleLabel.textColor = .black
        titleLabel.text = value.title.capitalized(with: .autoupdatingCurrent)
        switcher.isOn = value.isCheck // Установите состояние переключателя
        checkImage.isHidden = !value.isCheck // Управление видимостью галочки
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
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -80.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 0)
            $0.width.equal(to: 0)
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
        borderLineView.backgroundColor = .gray.withAlphaComponent(0.5)
        
        containerView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -60.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 40.0)
            $0.width.equal(to: 63.0)
        }
        switcher.onTintColor = .init(named: "ActualPink")
        // switcher.addTarget(self, action: #selector(perspectiveSwitchValueChanged(_:)), for: .valueChanged)
        switcher.addTarget(self, action: #selector(toggleTapped(_:)), for: .valueChanged)
        
        containerView.addSubview(blockView)
        blockView.backgroundColor = .clear
        blockView.perspectiveLayout{
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -60.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 40.0)
            $0.width.equal(to: 63.0)
        }
        
        
        
        
    }
    
    @objc func toggleTapped(_ sender: UISwitch) {
           delegate?.toggleTapped(self)
    }
}
    
    
    
    
    
    
    
    // Обработчик изменения состояния переключателя
//        @objc private func switchValueChanged(_ sender: UISwitch) {
//            let isChecked = sender.isOn
//            checkImage.isHidden = !isChecked
//            // Получите индекс ячейки
//            guard let indexPath = self.indexPath else { return }
//            // Уведомите делегата о изменении состояния переключателя
//            delegate?.switchValueChanged(at: indexPath, isOn: isChecked)
//        
// }
//}


