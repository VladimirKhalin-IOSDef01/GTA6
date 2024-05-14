

import Foundation
import UIKit

final class ActualChecklistCell: UICollectionViewCell, ActualReusable {
    
    public var isCheckAction: ((Bool) -> ())?
    
    private let containerView = UIView()
    private let buttonView = UIView()
    private let titleLabel = UILabel()
    private let buttonLabel = UILabel()
    private let switcher = ActualChecklistButton()
    
    override func prepareForReuse() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.prepareForReuse()
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        switcher.isOn = false
        isCheckAction = nil   // Сброс обработчика действий
    }
    
    override init(frame: CGRect) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.init(frame: frame)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
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
    
    public func actualConfigure_cell(_ value: ActualMissionItem) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: UIDevice.current.userInterfaceIdiom == .pad ? 24.0 : 16.0)
        titleLabel.textColor = .white
        titleLabel.text = value.missionName
        switcher.isOn = value.isCheck
    }
    
    private func actualSetupLayout() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.actualLayout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 7.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -7.0)
            $0.width.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 221 : 163)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 125 : 90)
            $0.centerX.equal(to: containerView.centerXAnchor)
        }
        containerView.withCornerRadius(24.0)
        containerView.withBorder(width: 1, color: UIColor(named: "ActualPink")!.withAlphaComponent(0.5))
        containerView.actualDropShadowStandart()
        containerView.backgroundColor = UIColor(named: "ActualBlack")?.withAlphaComponent(0.7)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(titleLabel)
        titleLabel.actualLayout {
            $0.top.equal(to: containerView.topAnchor, offsetBy: 5.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: UIDevice.current.userInterfaceIdiom == .pad ? 66 : 46)
            $0.centerX.equal(to: containerView.centerXAnchor)
        }
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        containerView.addSubview(switcher)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.actualLayout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? -30 : -13.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 13.0)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -10.0)
            $0.height.equal(to: 30.0)
        }
        
        switcher.addTarget(self, action: #selector(actualSwitchValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func actualSwitchValueChanged(_ sender: ActualChecklistButton) {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        isCheckAction?(sender.isOn)
    }
}
