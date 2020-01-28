//
//  VoiceOverBadViewController.swift
//  AccessibilityScarpz
//
//  Created by Felipe Scarpitta on 27/01/2020.
//  Copyright © 2020 scarpz. All rights reserved.
//

import UIKit

class VoiceOverBadViewController: UIViewController {

    // MARK: - Private Outlets
    @IBOutlet private weak var infoStackView: UIStackView!
    @IBOutlet private weak var adviceLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    // MARK: - Private Actions
    @IBAction func switchToggled(_ sender: UISwitch) {
        self.adviceLabel.isHidden = !sender.isOn
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        
        for artist in MockService.getArtistInfos() {
            let badView = BadInfoView()
            badView.displayInfo(for: artist)
            self.infoStackView.addArrangedSubview(badView)
        }
        
    }
}
