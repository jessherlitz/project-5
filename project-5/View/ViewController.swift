//
//  ViewController.swift
//  project-5
//
//  Created by Jessica Sampaio-Herlitz on 11/12/24.

import UIKit

class ViewController: UIViewController, AdventureViewDelegate {
    
    private let adventureController = AdventureController()
        
        @IBOutlet weak var topLabel: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
        @IBOutlet weak var background: UIImageView!
        @IBOutlet weak var optionsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adventureController.delegate = self
        adventureController.startAdventure()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        adventureController.chooseOption(at: sender.tag)
    }
    
    
    func displayStage(description: String, options: [String], image: String) {
        descriptionLabel.text = description
        background.image = UIImage(named: image)
        
        optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (index, option) in options.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(option, for: .normal)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.textAlignment = .center
            button.tag = index
            button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            optionsStackView.addArrangedSubview(button)
        }
    }
    
    func displayEndOfAdventure(successMessage: String) {
        descriptionLabel.text = successMessage
        optionsStackView.isHidden = true
    }
}

    

