

import Foundation
import UIKit

final class PerspectiveChecklistCell: UICollectionViewCell, PerspectiveReusable {
    
    public var isCheckAction: ((Bool) -> ())?
    
    private let containerView = UIView()
    private let buttonView = UIView()
    private let titleLabel = UILabel()
    private let buttonLabel = UILabel()
    
    // private let switcher = UISwitch()
    //  private let switcher = PerspectiveCheckListCustomSwitcher()  !!!
    //  private let switcher = ActualChecklistChecker()
    private let switcher = ActualChecklistButton()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        switcher.isOn = false
        isCheckAction = nil   // Сброс обработчика действий
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        perspectiveSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func perspectiveConfigure_cell(_ value: PerspectiveMissionItem) {
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: UIDevice.current.userInterfaceIdiom == .pad ? 24.0 : 16.0)
        titleLabel.textColor = .white
        titleLabel.text = value.missionName
        switcher.isOn = value.isCheck
    }
    
    private func perspectiveSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 7.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -7.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 221 : 163)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 125 : 90)
            $0.centerX.equal(to: containerView.centerXAnchor)
        }
        containerView.withCornerRadius(24.0)
        containerView.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.5))
        containerView.perspectiveDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.7)
        
        containerView.addSubview(titleLabel)
        titleLabel.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 5.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 66 : 46)
            $0.centerX.equal(to: containerView.centerXAnchor)
        }
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        
        containerView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -30 : -13.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 13.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -10.0)
            $0.height.equal(to: 30.0)
        }
        
        switcher.addTarget(self, action: #selector(perspectiveSwitchValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func perspectiveSwitchValueChanged(_ sender: ActualChecklistButton) {
        isCheckAction?(sender.isOn)
    }
}




/*
//final class PerspectiveChecklistCell: UITableViewCell, PerspectiveReusable {
    final class PerspectiveChecklistCell: UITableViewCell, PerspectiveReusable {
    
    public var isCheckAction: ((Bool) -> ())?
    
    private let containerView = UIView()
    private let buttonView = UIView()
    private let titleLabel = UILabel()
    private let buttonLabel = UILabel()
    
    // private let switcher = UISwitch()
    //  private let switcher = PerspectiveCheckListCustomSwitcher()  !!!
    //  private let switcher = ActualChecklistChecker()
    private let switcher = ActualChecklistButton()
    
    override func prepareForReuse() {
           super.prepareForReuse()
        
           switcher.isOn = false
           isCheckAction = nil   // Сброс обработчика действий
       }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        perspectiveSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func perspectiveConfigure_cell(_ value: PerspectiveMissionItem) {
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: UIDevice.current.userInterfaceIdiom == .pad ? 16.0 : 16.0)
        titleLabel.textColor = .white
        titleLabel.text = value.missionName
        switcher.isOn = value.isCheck
    }
    
    private func perspectiveSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 7.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -7.0)
            $0.width.equal(to: 163)
            $0.height.equal(to: 90)
            $0.centerX.equal(to: containerView.centerXAnchor)
           // $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
           // $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 24.0)
        containerView.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.45))
        containerView.perspectiveDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.6)

        containerView.addSubview(titleLabel)
       // titleLabel.perspectiveDropShadowStandart(color: .black, offSet: CGSize(width: 1, height: 1))
        titleLabel.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 5.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: 46)
            $0.centerX.equal(to: containerView.centerXAnchor)
        }
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
       
        /*
        containerView.addSubview(buttonView)
        buttonView.layer.borderColor = UIColor(named: "ActualPink")!.withAlphaComponent(0.45).cgColor
        buttonView.layer.borderWidth = 1
        buttonView.clipsToBounds = true
        buttonView.layer.cornerRadius = 15
        buttonView.backgroundColor = UIColor.white.withAlphaComponent(0.05)
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.7)
        buttonView.perspectiveLayout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 3)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15)
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -10)
            $0.height.equal(to: 30)
        }
        
        
        buttonView.addSubview(buttonLabel)
        buttonLabel.font = UIFont(name: "Gilroy-Regular", size: 14.0)
        buttonLabel.textColor = .white.withAlphaComponent(0.3)
        buttonLabel.text = "COMPLETED"
        buttonLabel.perspectiveLayout {
            $0.leading.equal(to: buttonView.leadingAnchor, offsetBy: 10)
            $0.centerY.equal(to: buttonView.centerYAnchor)
        }
         
        
        buttonView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.perspectiveLayout {
            $0.trailing.equal(to: buttonView.trailingAnchor, offsetBy: -10.0)
            $0.centerY.equal(to: buttonView.centerYAnchor)
            $0.height.equal(to: 15.0)
            $0.width.equal(to: 25.0)
        }
        */
        
        containerView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -13.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 13.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -10.0)
            $0.height.equal(to: 30.0)
        }
        
        
        
        
        
        
         switcher.addTarget(self, action: #selector(perspectiveSwitchValueChanged(_:)), for: .valueChanged)
    }
    
//    @objc func perspectiveSwitchValueChanged(_ sender: PerspectiveCheckListCustomSwitcher) {
//        isCheckAction?(sender.isOn)
//        
//    }
    @objc func perspectiveSwitchValueChanged(_ sender: ActualChecklistButton) {
        isCheckAction?(sender.isOn)
        
    }
    
}
*/
