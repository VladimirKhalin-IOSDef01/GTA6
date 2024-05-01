//
//  ActualFakeLoaderView.swift
//  GTAModes
//
//  Created by Vladimir Khalin on 01.05.2024.
//

import UIKit

class CircularFakeLoaderView: UIView {
    
    private var circlePath: UIBezierPath!
    private var progressLayer: CAShapeLayer!
    private var dotLayer: CALayer!
    private var timer: Timer?
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
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
        
        let dotRadius: CGFloat = 12
        dotLayer = CALayer()
        dotLayer.backgroundColor = UIColor.purple.cgColor
        dotLayer.cornerRadius = dotRadius
        dotLayer.frame = CGRect(x: 68, y: -2, width: dotRadius * 2, height: dotRadius * 2)
        
 
        let initialDotPosition = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 - (frame.size.width / 2 - 10))
        dotLayer.position = initialDotPosition
        
        layer.addSublayer(dotLayer)
        
        addSubview(percentageLabel)
        NSLayoutConstraint.activate([
            percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func startAnimation(duration: TimeInterval) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = circlePath.cgPath
        animation.duration = duration
        animation.repeatCount = 1
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        dotLayer.add(animation, forKey: "circleAnimation")

        startPercentageTimer(duration: duration)
    }

    private func startPercentageTimer(duration: TimeInterval) {
        timer?.invalidate()  // Stop any previous timer
        var elapsed: TimeInterval = 0
        let interval: TimeInterval = 0.05

        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            elapsed += interval
            let percentage = min(100, Int((elapsed / duration) * 100))
            self.percentageLabel.text = "\(percentage)%"

            if elapsed >= duration {
                timer.invalidate()
                self.percentageLabel.text = "100%"
                self.dotLayer.removeAllAnimations() // Remove all animations
            }
        }
    }
}


