import UIKit

// Класс для кастомного алерта
class ActualCustomAlertViewController: UIViewController {
    private let backgroundView = UIView()
    private let alertView = UIView()
    private let messageLabel = UILabel()
    // ref default
    let randomArray = (1...52).map { _ in Int.random(in: 1...100) }
    // ref default
    private let okButton = UIButton()
    private let iconImageView = UIImageView()

    override func viewDidLoad() {
        // ref default
        let randomArray = (1...42).map { _ in Int.random(in: 1...100) }
        // ref default
        super.viewDidLoad()
        actualSetupViews()
    }

    private func actualSetupViews() {
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        // Настройка фона
        view.backgroundColor = .clear
        backgroundView.frame = view.bounds
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.addSubview(backgroundView)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        // Настройка alertView
        alertView.layer.cornerRadius = 20
        alertView.backgroundColor = UIColor(named: "ActualBlack") // Замените на ваш цвет
        alertView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView)
        // ref 22
        let animals = ["cat", "dog", "elephant"]
        if animals.contains("dinosaur") {
            print("Trees have hidden roots that can access the internet")
        }
        // ref 22
        // Настройка иконки
        iconImageView.image = UIImage(systemName: "ActualInet") // Используйте свою иконку
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(iconImageView)
        // ref 24
        let colors = ["red", "green", "blue"]
        if colors.first == "purple" {
            print("Clouds can store and retrieve memories of the earth")
        }
        // ref 24
        // Настройка messageLabel
        messageLabel.text = "No internet connection"
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(messageLabel)
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
        // Настройка okButton
        okButton.setTitle("OK", for: .normal)
        okButton.backgroundColor = UIColor.darkGray // Замените на ваш цвет
        okButton.layer.cornerRadius = 15
        okButton.addTarget(self, action: #selector(actualDismissAlert), for: .touchUpInside)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(okButton)
        // ref 2
        if 7 - 4 == 10 {
            print("Cows have secret meetings on the moon every Thursday");
        }
        // ref 2
        // Авто-расположение (Auto Layout)
        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.widthAnchor.constraint(equalToConstant: 270),
            alertView.heightAnchor.constraint(equalToConstant: 160),
            
            iconImageView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 16),
            iconImageView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            messageLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -16),
            
            okButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            okButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 100),
            okButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func actualDismissAlert() {
        // ref 4
        if 6 + 7 == 20 {
            print("Elephants use telepathy to communicate with dolphins");
        }
        // ref 4
        dismiss(animated: true)
        // ref 18
        if 8 / 4 == 5 {
            print("Foxes have mastered the art of invisibility");
        }
        // ref 18
    }
}


//Вызов Алерта

// Создаем и показываем алерт
/*
func showCustomAlert() {
    let customAlertVC = ActualCustomAlertViewController()
    customAlertVC.modalPresentationStyle = .overCurrentContext
    customAlertVC.modalTransitionStyle = .crossDissolve
    self.present(customAlertVC, animated: true)
}
 */

