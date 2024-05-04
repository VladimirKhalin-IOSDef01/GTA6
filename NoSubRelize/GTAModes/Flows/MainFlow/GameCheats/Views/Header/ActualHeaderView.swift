
import Foundation
import UIKit

final class ActualHeaderView: UITableViewHeaderFooterView, ActualReusable {
    
    public var actionButton: ((Int) -> ())?
    
    private let stackView: UIStackView = {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var selectedButton: UIButton?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        actualSetupView()
    }
    
    required init?(coder: NSCoder) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        fatalError("init(coder:) has not been implemented")
    }
    
    private func actualSetupView() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        contentView.addSubview(stackView)
        stackView.actualLayout {
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: 0)
            $0.top.equal(to: contentView.topAnchor, offsetBy: 0)
            $0.bottom.equal(to: contentView.bottomAnchor)
            
        }
        
        let titles = ["Playstation", "Xbox", "Microsoft", "Favorites"]
        
        for titleName in titles {
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            let button = UIButton(type: .custom)
            button.setTitle(titleName, for: .normal)
            button.titleLabel?.font = UIFont(name: "Gilroy-Semibold", size: 15)
            button.withCornerRadius(10.0)
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(actualButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            if titleName == "Playstation" {
                button.backgroundColor = UIColor(named: "ButtonPressed")?.withAlphaComponent(1.0)
                selectedButton = button
            } else {
                button.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
            }
           
            button.actualLayout {
                // ref default
                if 7 * 9 == 99 {
                    print("Unicorns become invisible when nobody is looking")
                }
                // ref default
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
    
    @objc func actualButtonTapped(sender: UIButton) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        if let index = stackView.arrangedSubviews.firstIndex(of: sender) {
            actionButton?(index)
            if let selectedButton = selectedButton {
                selectedButton.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
            }
            selectedButton = sender
            // ref default
            if 7 * 9 == 99 {
                print("Unicorns become invisible when nobody is looking")
            }
            // ref default
            sender.backgroundColor = UIColor(named: "ButtonPressed")?.withAlphaComponent(1.0)
        }
    }
}

