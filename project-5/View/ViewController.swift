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
        UIView.animate(withDuration: 0.2, animations: {
            self.descriptionLabel.alpha = 0
            self.background.alpha = 0.4
            self.optionsStackView.alpha = 0
        }) { _ in
            self.descriptionLabel.text = description
            self.background.image = UIImage(named: image)
            
            self.optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
            for (index, option) in options.enumerated() {
                let button = UIButton(type: .system)
                button.setTitle(option, for: .normal)
                button.titleLabel?.numberOfLines = 3
                button.titleLabel?.lineBreakMode = .byWordWrapping
                button.titleLabel?.textAlignment = .center
                button.tag = index
                button.backgroundColor = .lightGray
                button.setTitleColor(.black, for: .normal)
                button.layer.cornerRadius = 4
                button.layer.masksToBounds = true
                button.translatesAutoresizingMaskIntoConstraints = false
                button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                
                self.optionsStackView.axis = .horizontal
                self.optionsStackView.alignment = .center
                self.optionsStackView.distribution = .fillEqually
                self.optionsStackView.spacing = 10
                
                button.addTarget(self, action: #selector(self.buttonTouchDown(_:)), for: .touchDown)
                button.addTarget(self, action: #selector(self.buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside])
                button.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
                
                self.optionsStackView.addArrangedSubview(button)
            }
            
            UIView.animate(withDuration: 0.2) {
                self.descriptionLabel.alpha = 1
                self.background.alpha = 0.5
                self.optionsStackView.alpha = 1
            }
        }
    }
    
    
    func displayEndOfAdventure(successMessage: String) {
        UIView.animate(withDuration: 0.2, animations: {
            self.descriptionLabel.alpha = 0
            self.optionsStackView.alpha = 1
        }) { _ in
            self.descriptionLabel.text = successMessage
            self.optionsStackView.isHidden = false
            self.showButton()
            
            UIView.animate(withDuration: 0.2) {
                self.descriptionLabel.alpha = 1
            }
        }
    }
    
    func showButton() {
        self.optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let button = UIButton(type: .system)
        button.setTitle("Restart Adventure", for: .normal)
        button.titleLabel?.numberOfLines = 3
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(self.buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside])
        button.addTarget(self, action: #selector(self.buttonPressed(_:)), for: .touchUpInside)
        
        button.addTarget(self, action: #selector(restartAdventure), for: .touchUpInside)
        self.optionsStackView.addArrangedSubview(button)
    }
    
    @objc func restartAdventure() {
        adventureController.restartAdventure()
    }
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.backgroundColor = .darkGray
        }
    }

    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.backgroundColor = .lightGray
        }
    }
}

    

