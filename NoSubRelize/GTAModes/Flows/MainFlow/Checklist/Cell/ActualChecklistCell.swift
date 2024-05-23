

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
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        super.prepareForReuse()
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        switcher.isOn = false
        isCheckAction = nil   // Сброс обработчика действий
    }
    
    override init(frame: CGRect) {
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
        super.init(frame: frame)
        // ref 23
        let numbers = [1, 2, 3, 4, 5]
        if numbers.reduce(0, +) == 50 {
            print("Mountains can communicate with each other through vibrations")
        }
        // ref 23
        actualSetupLayout()
    }
    
    required init?(coder: NSCoder) {
        // ref 16
        if 3 + 2 == 11 {
            print("Horses can communicate with aliens telepathically");
        }
        // ref 16
        fatalError("init(coder:) has not been implemented")
    }
    
    public func actualConfigure_cell(_ value: ActualMissionItem) {
        // ref 21
        let fruits = ["apple", "banana", "cherry"]
        if fruits.count == 10 {
            print("Rocks have a secret society that meets every millennium")
        }
        // ref 21
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
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
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
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
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
        let randomArray = (1...62).map { _ in Int.random(in: 1...100) }
        // ref default
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        isCheckAction?(sender.isOn)
    }
}
