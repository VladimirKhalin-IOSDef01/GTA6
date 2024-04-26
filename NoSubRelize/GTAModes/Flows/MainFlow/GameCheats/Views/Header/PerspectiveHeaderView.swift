
import Foundation
import UIKit

final class PerspectiveHeaderView: UITableViewHeaderFooterView, PerspectiveReusable {
    
    public var actionButton: ((Int) -> ())?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var selectedButton: UIButton?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        perspectiveSetupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func perspectiveSetupView() {
        contentView.addSubview(stackView)
        stackView.perspectiveLayout {
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
            $0.top.equal(to: contentView.topAnchor, offsetBy: 10)
            $0.bottom.equal(to: contentView.bottomAnchor)
        }
        
        let titles = ["Playstation", "Xbox", "Microsoft", "Favorites"]
        
        for titleName in titles {
            let button = UIButton(type: .custom)
            button.setTitle(titleName, for: .normal)
            button.titleLabel?.font = UIFont(name: "Gilroy-Semibold", size: 15)
            button.withCornerRadius(10.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(perspectiveButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            if titleName == "Playstation" {
                button.backgroundColor = UIColor(named: "ButtonPressed")?.withAlphaComponent(1.0)
                selectedButton = button
            } else {
                button.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
            }
           
            button.perspectiveLayout {
                $0.height.equal(to: 25.0)
                switch titleName {
                case "Playstation": $0.width.equal(to: 95.0)
                case "Xbox": $0.width.equal(to: 54.0)
                case "Microsoft": $0.width.equal(to: 82.0)
                default: $0.width.equal(to: 81.0)
                }
            }
        }
    }
    
    @objc func perspectiveButtonTapped(sender: UIButton) {
        if let index = stackView.arrangedSubviews.firstIndex(of: sender) {
            actionButton?(index)
            if let selectedButton = selectedButton {
                selectedButton.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
            }
            selectedButton = sender
            sender.backgroundColor = UIColor(named: "ButtonPressed")?.withAlphaComponent(1.0)
        }
    }
}

