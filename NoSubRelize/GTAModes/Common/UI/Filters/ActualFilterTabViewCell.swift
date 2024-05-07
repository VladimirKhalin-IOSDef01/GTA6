//
//  FilterTableViewCell.swift
//  GTAModes
//
//  Created by Максим Педько on 31.07.2023.
//

import Foundation
import UIKit

final class ActualFilterTabViewCell: UITableViewCell, ActualReusable {
   
    weak var delegate: ActualFilterTabViewCellDelegate?
    var indexPath: IndexPath?
    var tableView: UITableView? // Добавлено свойство tableView
    
    public var isCheckAction: ((Bool) -> ())?
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let checkImage = UIImageView()
    let borderLineView = UIView()
    private let blockView = UIView()
    let switcher = UISwitch()
    
    override func prepareForReuse() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.prepareForReuse()
        switcher.isOn = false
        switcher.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        actualSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fatalError("init(coder:) has not been implemented")
    }
    
    public func actualConfigure_cell(_ value: ActualFilterData) {
        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: UIDevice.current.userInterfaceIdiom == .pad ? 20 : 18)
        titleLabel.textColor = .black
        titleLabel.text = value.title.capitalized(with: .autoupdatingCurrent)
        switcher.isOn = value.isCheck // Установите состояние переключателя
        checkImage.isHidden = !value.isCheck // Управление видимостью галочки
        
       
    }
    
    private func actualSetupLayout() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        // contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        // containerView.backgroundColor = .clear
        
        containerView.actualLayout {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            $0.top.equal(to: contentView.topAnchor)
            $0.bottom.equal(to: contentView.bottomAnchor)
            $0.leading.equal(to: contentView.leadingAnchor)
            $0.trailing.equal(to: contentView.trailingAnchor)
        }
        containerView.addSubview(checkImage)
        checkImage.actualLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -80.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 0)
            $0.width.equal(to: 0)
        }
        checkImage.image = .init(named: "checkIcon")
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(titleLabel)
        titleLabel.actualLayout {
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 16.0)
            $0.trailing.equal(to: checkImage.leadingAnchor, offsetBy: -4.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
        }
        containerView.addSubview(borderLineView)
        borderLineView.actualLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -20)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 20.0)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.height.equal(to: 1.5)
        }
        //borderLineView.backgroundColor = .init(named: "cellLineColor")
        borderLineView.backgroundColor = .gray.withAlphaComponent(0.5)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.actualLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -60.0 : -17)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 40.0)
            $0.width.equal(to: 63.0)
        }
        switcher.onTintColor = .init(named: "ActualPink")
        // switcher.addTarget(self, action: #selector(perspectiveSwitchValueChanged(_:)), for: .valueChanged)
        switcher.addTarget(self, action: #selector(toggleTapped(_:)), for: .valueChanged)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        
            containerView.addSubview(blockView)
            blockView.backgroundColor = .clear
            blockView.actualLayout{
                $0.trailing.equal(to: containerView.trailingAnchor, offsetBy:  UIDevice.current.userInterfaceIdiom == .pad ? -60.0 : -17)
                $0.centerY.equal(to: containerView.centerYAnchor)
                $0.height.equal(to: 40.0)
                $0.width.equal(to: 63.0)
            }
        
        
        
        
    }
    
    @objc func toggleTapped(_ sender: UISwitch) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
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


