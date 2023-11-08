//
//  ViewController.swift
//  SMUIK_3
//
//  Created by Andrei Kovryzhenko on 08.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var squareView = UIView()
    private var slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        setUpButton()
        setUpSlider()
    }
    
    private func setUpButton() {
        squareView.backgroundColor = .blue
        squareView.layer.cornerRadius = 12
        squareView.frame = CGRect(x: view.layoutMargins.left, y: 100, width: 100, height: 100)
        
        view.addSubview(squareView)
    }
    
    private func setUpSlider() {
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderTouchUp), for: .touchUpInside)
        slider.frame = CGRect(x: view.layoutMargins.left, y: 250, width: view.bounds.width - view.layoutMargins.left - view.layoutMargins.right, height: 20)
        
        view.addSubview(slider)
    }
    
    @objc func sliderValueChanged() {
        let value = CGFloat(slider.value)
        moveAnimate(value: value)
    }
    
    
    @objc func sliderTouchUp() {
        let value = CGFloat(slider.maximumValue)
        moveAnimate(value: value)
       
        UIView.animate(withDuration: 0.5) {
            let translationX = self.view.frame.width - self.view.layoutMargins.right - self.squareView.frame.width
            
            self.squareView.transform = CGAffineTransform.identity
                .translatedBy(x: translationX, y: 0)
                .scaledBy(x: 1.5, y: 1.5)
                .rotated(by: 0.5 * .pi)
        }
        slider.setValue(slider.maximumValue, animated: true)
        
    }
    
    private func moveAnimate(value: CGFloat ) {
        UIView.animate(withDuration: 0.5) {
            let scaleFactor = 1 + value/2
            let rotationAngle = value/2 * .pi
            let translationX = self.view.frame.width - self.view.layoutMargins.left - self.squareView.frame.width
            let translationDistance = round(translationX * value)
            
            self.squareView.transform = CGAffineTransform.identity
                .translatedBy(x: translationDistance, y: 0)
                .scaledBy(x: scaleFactor, y: scaleFactor)
                .rotated(by: rotationAngle)
        }
    }
}



