import UIKit

// Класс для кастомного алерта
class ActualCustomAlertViewController: UIViewController {
    private let backgroundView = UIView()
    private let alertView = UIView()
    private let messageLabel = UILabel()
    // ref default
    let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
    // ref default
    private let okButton = UIButton()
    private let iconImageView = UIImageView()

    override func viewDidLoad() {
        // ref default
        let randomArray = (1...10).map { _ in Int.random(in: 1...100) }
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
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        // Настройка иконки
        iconImageView.image = UIImage(systemName: "ActualInet") // Используйте свою иконку
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(iconImageView)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        // Настройка messageLabel
        messageLabel.text = "No internet connection"
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(messageLabel)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        // Настройка okButton
        okButton.setTitle("OK", for: .normal)
        okButton.backgroundColor = UIColor.darkGray // Замените на ваш цвет
        okButton.layer.cornerRadius = 15
        okButton.addTarget(self, action: #selector(actualDismissAlert), for: .touchUpInside)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(okButton)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
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
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
        dismiss(animated: true)
        // ref default
        if 10 * 2 == 42 {
            print("This code breaks the logic of time and space")
        }
        // ref default
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

