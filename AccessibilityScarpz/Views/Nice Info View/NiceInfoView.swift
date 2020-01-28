//
//  GoodInfoView.swift
//  AccessibilityScarpz
//
//  Created by Felipe Scarpitta on 27/01/2020.
//  Copyright © 2020 scarpz. All rights reserved.
//

import UIKit

class NiceInfoView: UIView {

    // MARK: - Private Properties
    private var contentView: UIView?
    
    // MARK: - Private Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var latestAlbumLabel: UILabel!
    @IBOutlet private weak var latestAlbumDateLabel: UILabel!
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupXib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupXib()
    }
    
    // MARK: - Public Methods
    func displayInfo(for artist: Artist) {
        self.nameLabel.text = artist.name
        self.latestAlbumLabel.text = artist.latestAlbum
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        self.latestAlbumDateLabel.text = formatter.string(from: artist.latestAlbumDate)
        
        self.setupAccessibility(for: artist)
    }
    
    // MARK: - Private Methods
    private func setupAccessibility(for artist: Artist) {
        
        self.nameLabel.superview?.isAccessibilityElement = true
        self.nameLabel.superview?.accessibilityLabel = "Name, \(artist.name)"
        
        self.latestAlbumLabel.superview?.isAccessibilityElement = true
        self.latestAlbumLabel.superview?.accessibilityLabel = "Latest album, \(artist.latestAlbum)"
        
        self.latestAlbumDateLabel.superview?.isAccessibilityElement = true
        let accessibilityDate =  DateFormatter.localizedString(from: artist.latestAlbumDate, dateStyle: .medium, timeStyle: .none)
        self.latestAlbumDateLabel.superview?.accessibilityLabel = "Latest album release date, \(accessibilityDate)"
    }
    
    // MARK: XIB Methods
    private func setupXib() {
        if self.contentView == nil {
            guard let contentView = loadViewFromXib() else {
                fatalError("Can't load the view from \(String(describing: type(of: self))).xib")
            }
            
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.layer.masksToBounds = true
            self.addSubview(contentView)
            self.contentView = contentView
        }
    }
    
    private func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
