//
//  VoiceOverNiceViewController.swift
//  AccessibilityScarpz
//
//  Created by Felipe Scarpitta on 27/01/2020.
//  Copyright © 2020 scarpz. All rights reserved.
//

import UIKit

class VoiceOverNiceViewController: UIViewController {

    // MARK: - Private Outlets
    @IBOutlet private weak var infoStackView: UIStackView!
    @IBOutlet private weak var adviceLabel: UILabel!
    @IBOutlet private weak var adviceSwitch: UISwitch!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        
        for artist in MockService.getArtistInfos() {
            let badView = NiceInfoView()
            badView.displayInfo(for: artist)
            self.infoStackView.addArrangedSubview(badView)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.toggleSwitch))
        self.adviceSwitch.superview?.addGestureRecognizer(tapGesture)
        
        self.setupAccessibility()
    }
    
    private func setupAccessibility() {
        self.adviceSwitch.superview?.isAccessibilityElement = true
        self.adviceSwitch.superview?.accessibilityLabel = "Want an advice? Switch button, off."
        self.adviceSwitch.superview?.accessibilityHint = "Double tap to toggle"
        
        self.adviceSwitch.isUserInteractionEnabled = false
        
        self.adviceLabel.accessibilityLabel = "Drink water. It hydrates you"
    }
    
    @objc private func toggleSwitch() {
        self.adviceSwitch.setOn(!self.adviceSwitch.isOn, animated: true)
    
        self.adviceLabel.isHidden = !self.adviceSwitch.isOn
        
        let switchState = self.adviceSwitch.isOn ? "on" : "off"
        self.adviceSwitch.superview?.accessibilityLabel = "Want an advice? Switch button, \(switchState)."
        
        let view: UIView? = self.adviceSwitch.isOn ? self.adviceLabel : nil
        
        UIAccessibility.post(notification: .layoutChanged, argument: view)
    }
}
