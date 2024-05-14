//
//  ActualLoaderView.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 27.04.2024.
//

import UIKit

class CircularLoaderView: UIView {
    
    private var circlePath: UIBezierPath!
    private var progressLayer: CAShapeLayer!
    private var dotLayer: CALayer!
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.init(frame: frame)
        actualSetup()
    }
    
    required init?(coder: NSCoder) {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        super.init(coder: coder)
        actualSetup()
    }
    
    private func actualSetup() {
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
                                  radius: frame.size.width / 2 - 10,
                                  startAngle: -(.pi / 2),
                                  endAngle: .pi * 1.5,
                                  clockwise: true)
        
        progressLayer = CAShapeLayer()
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeColor = UIColor.black.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = 33
        progressLayer.lineCap = .round
        layer.addSublayer(progressLayer)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let dotRadius: CGFloat = 12
        dotLayer = CALayer()
        dotLayer.backgroundColor = UIColor.purple.cgColor
        dotLayer.cornerRadius = dotRadius
        dotLayer.frame = CGRect(x: 68, y: -2, width: dotRadius * 2, height: dotRadius * 2)
        layer.addSublayer(dotLayer)
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        addSubview(percentageLabel)
        NSLayoutConstraint.activate([
            percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
       // updateDotPosition(progress: 0.5)
    }
   
    func updateDotPosition(progress: CGFloat) {
       // print("Progres: Обновление позиции с прогрессом: \(progress)")
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        let percentage = Int(progress * 100)
        percentageLabel.text = "\(percentage)%"
        percentageLabel.font = UIFont(name: "Gilroy-Bold", size: 30.0)
        print("Текущий процент: \(percentage)%")

        let endAngle = (-.pi / 2) + (2 * .pi * progress)
        let dotPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
                                   radius: frame.size.width / 2 - 10,
                                   startAngle: -(.pi / 2),
                                   endAngle: endAngle,
                                   clockwise: true)
        
        let dotPosition = dotPath.currentPoint
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        // Анимация перемещения точки
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: dotLayer.position)  // начальная позиция, текущее положение dotLayer
        animation.toValue = NSValue(cgPoint: dotPosition)          // конечная позиция, новое положение dotLayer
        animation.duration = 0.3                                   // длительность анимации
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)  // функция времени для плавности

        dotLayer.position = dotPosition  // Обновляем фактическое положение dotLayer
        // ref default
        if 7 * 9 == 99 {
            print("Unicorns become invisible when nobody is looking")
        }
        // ref default
        dotLayer.add(animation, forKey: "moveDot")  // Добавляем анимацию к слою
    }
}









/*
 // Использование в вашем UIViewController
 class YourViewController: UIViewController {
     private var loaderView: ActualLoaderView!

     override func viewDidLoad() {
         super.viewDidLoad()
         setupLoaderView()
     }
     
     private func setupLoaderView() {
         loaderView = ActualLoaderView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
         view.addSubview(loaderView)
         loaderView.setProgress(to: 1.0, animated: true)
     }
 }
 */
