//
//  ViewController.swift
//  Three Buttons Project
//
//  Created by Gamid Gapizov on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let button1 = UIButtonEX()
    let button2 = UIButtonEX()
    let button3 = UIButtonEX()
    
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createButton(text: "First Button", button: button1, topConstraint: 50)
        createButton(text: "Second Medium Button", button: button2, topConstraint: 100)
        createButton(text: "Third", button: button3, topConstraint: 150)
    }
    
    private func createButton(text: String, button: UIButton, _ buttonColor: UIColor = .systemBlue, _ tintColor: UIColor = .white, topConstraint: CGFloat) {
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = text
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.background.cornerRadius = 6
        
        let button = UIButtonEX(configuration: configuration)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: topConstraint)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: UIButton){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: [.curveEaseIn, .beginFromCurrentState, .allowUserInteraction]) {
            sender.transform = .init(scaleX: 0.9, y: 0.9)
        } completion: { Bool in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: [.curveEaseIn, .beginFromCurrentState, .allowUserInteraction], animations: {
                sender.transform = .init(scaleX: 1, y: 1)
            })
        }
        
        if sender.titleLabel?.text == "Third" {
            let nextScreen = SecondViewController()
            present(nextScreen, animated: true)
        }
        
        sender.isHighlighted = true
    }
}


class UIButtonEX: UIButton {
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        if tintAdjustmentMode == .dimmed {
            self.backgroundColor = .systemGray2
            self.titleLabel?.textColor = UIColor.systemGray3
            self.imageView?.tintColor = UIColor.systemGray3
        } else if tintAdjustmentMode == .normal {
            configuration?.baseBackgroundColor = .systemBlue
            configuration?.baseForegroundColor = .white
        }
    }
}
