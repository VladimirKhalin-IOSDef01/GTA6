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
        label.text = "100%"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        let dotRadius: CGFloat = 10
        dotLayer = CALayer()
        dotLayer.backgroundColor = UIColor.purple.cgColor
        dotLayer.cornerRadius = dotRadius
        dotLayer.frame = CGRect(x: 0, y: 0, width: dotRadius * 2, height: dotRadius * 2)
        layer.addSublayer(dotLayer)
        
        addSubview(percentageLabel)
        NSLayoutConstraint.activate([
            percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        updateDotPosition(progress: 0.5)
    }
    
    func updateDotPosition(progress: CGFloat) {
        let endAngle = (-.pi / 2) + (2 * .pi * progress)
        let dotPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
                                   radius: frame.size.width / 2 - 10,
                                   startAngle: -(.pi / 2),
                                   endAngle: endAngle,
                                   clockwise: true)
        
        let dotPosition = dotPath.currentPoint
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        dotLayer.position = dotPosition
        CATransaction.commit()
        
        progressLayer.strokeEnd = progress
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
