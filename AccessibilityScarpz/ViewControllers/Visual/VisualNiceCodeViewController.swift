//
//  VisualNiceCodeViewController.swift
//  AccessibilityScarpz
//
//  Created by Felipe Scarpitta on 27/01/2020.
//  Copyright © 2020 scarpz. All rights reserved.
//

import UIKit

class VisualNiceCodeViewController: UIViewController {
    
    // MARK: - Private Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var niceButton: UIButton!
    
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAccessibility()
    }
    
    // MARK: - Private Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.imageView.isHidden = !self.imageView.isHidden
        self.imageView.image = self.imageView.isHidden ? nil : UIImage(named: "uncleDave")!
    }
    
    // MARK: - Private Methods
    private func setupAccessibility() {
        
        let titleFont = UIFont(name: "Chalkduster", size: 20) ?? UIFont.systemFont(ofSize: 20)
        let subTitleFont = UIFont(name: "AcademyEngravedLetPlain", size: 17) ?? UIFont.systemFont(ofSize: 17)
        let descriptionFont = UIFont(name: "Papyrus", size: 17) ?? UIFont.systemFont(ofSize: 17)
        let buttonFont = UIFont(name: "EuphemiaUCAS-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17)
        
        self.titleLabel.dynamicFont = titleFont
        self.subTitleLabel.dynamicFont = subTitleFont
        self.descriptionLabel.dynamicFont = descriptionFont
        self.niceButton.dynamicFont = buttonFont
    }

}
