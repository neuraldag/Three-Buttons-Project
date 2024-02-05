//
//  SecondViewController.swift
//  Three Buttons Project
//
//  Created by Gamid Gapizov on 05.02.2024.
//

import UIKit

class SecondViewController: UIViewController {

    let viKto = UIImageView(image: UIImage(named: "viKto"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(viKto)
        viKto.frame = .init(x: 0, y: 0, width: 300, height: 200)
        viKto.contentMode = .scaleAspectFill
        viKto.center.y = view.center.y
        viKto.center.x = view.center.x
    }
}
