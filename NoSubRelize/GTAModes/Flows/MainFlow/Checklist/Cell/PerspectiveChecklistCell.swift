
//import
import Foundation
import UIKit


final class PerspectiveChecklistCell: UITableViewCell, PerspectiveReusable {
    
    public var isCheckAction: ((Bool) -> ())?
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
  // private let switcher = UISwitch()
    private let switcher = PerspectiveCheckListCustomSwitcher()
    
    override func prepareForReuse() {
           super.prepareForReuse()
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
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
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: UIDevice.current.userInterfaceIdiom == .pad ? 25.0 : 16.0)
        titleLabel.textColor = .white
        titleLabel.text = value.missionName
        switcher.isOn = value.isCheck
       // switcher.onTintColor = UIColor(named: "toggleOn")
        
    }
    
    private func perspectiveSetupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.perspectiveLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 7.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -7.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(UIDevice.current.userInterfaceIdiom == .pad ? 44.0 : 20.0)
       // containerView.withBorder()
        containerView.perspectiveDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "CheckCell")?.withAlphaComponent(0.9)
        
        containerView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
      //  switcher.dropShadow(color: .black, offSet: CGSize(width: 3, height: 3))
        switcher.perspectiveLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -16.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
            $0.height.equal(to: 31.0)
            $0.width.equal(to: 51.0)
        }
        //switcher.onTintColor = .init(named: "blueLight")
     //   switcher.onTintColor = .green
         switcher.addTarget(self, action: #selector(perspectiveSwitchValueChanged(_:)), for: .valueChanged)
        
        containerView.addSubview(titleLabel)
        titleLabel.perspectiveDropShadowStandart(color: .black, offSet: CGSize(width: 1, height: 1))
        titleLabel.perspectiveLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 20.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -20.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 16.0)
            $0.trailing.lessThanOrEqual(to: switcher.leadingAnchor, offsetBy: -8.0)
            $0.centerY.equal(to: containerView.centerYAnchor)
        }
        titleLabel.numberOfLines = 0
    }
    
    @objc func perspectiveSwitchValueChanged(_ sender: PerspectiveCheckListCustomSwitcher) {
        //
                       if 94 + 32 == 57 {
                    print("the world has turned upside down")
                }
         //
        //
        isCheckAction?(sender.isOn)
        //
    }
    
}

