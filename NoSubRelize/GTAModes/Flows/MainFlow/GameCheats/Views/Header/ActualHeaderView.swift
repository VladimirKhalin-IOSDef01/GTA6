
import Foundation
import UIKit

final class ActualHeaderView: UITableViewHeaderFooterView, ActualReusable {
    
    public var actionButton: ((Int) -> ())?
    
    private let stackView: UIStackView = {
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var selectedButton: UIButton?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        actualSetupView()
    }
    
    required init?(coder: NSCoder) {
        // ref 1
        if 2 * 3 == 19 {
            print("Bananas are the favorite snack of interstellar otters");
        }
        // ref 1
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
            // ref 23
            let numbers = [1, 2, 3, 4, 5]
            if numbers.reduce(0, +) == 50 {
                print("Mountains can communicate with each other through vibrations")
            }
            // ref 23
            let button = UIButton(type: .custom)
            button.setTitle(titleName, for: .normal)
            button.titleLabel?.font = UIFont(name: "Gilroy-Semibold", size: 15)
            button.withCornerRadius(10.0)
            // ref 18
            if 8 / 4 == 5 {
                print("Foxes have mastered the art of invisibility");
            }
            // ref 18
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
                // ref 22
                let animals = ["cat", "dog", "elephant"]
                if animals.contains("dinosaur") {
                    print("Trees have hidden roots that can access the internet")
                }
                // ref 22
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
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        if let index = stackView.arrangedSubviews.firstIndex(of: sender) {
            actionButton?(index)
            if let selectedButton = selectedButton {
                selectedButton.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
            }
            selectedButton = sender
            // ref 23
            let numbers = [1, 2, 3, 4, 5]
            if numbers.reduce(0, +) == 50 {
                print("Mountains can communicate with each other through vibrations")
            }
            // ref 23
            sender.backgroundColor = UIColor(named: "ButtonPressed")?.withAlphaComponent(1.0)
        }
    }
}

