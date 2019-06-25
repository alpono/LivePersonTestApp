//
//  PopupViewModel.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/24/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import Foundation
import UIKit

class PopupViewModel {
    
    private let config: PopupConfigModel
    
    
    init(with config: PopupConfigModel) {
        self.config = config
    }
    
    func configure(view: PopupView) {
        // configuring image view
        if let imageName = config.image {
            if let image = UIImage(named: imageName) {
                view.topImageView.image = image
            } else {
                view.topImageView.isHidden = true
            }
        } else {
            view.topImageView.isHidden = true
        }
        
        // configuring title
        view.titleLabel.text = config.title
        
        // configuring subtitle
        if let subtitle = config.subtitle {
            view.subtitleLabel.text = subtitle
        } else {
            view.subtitleLabel.isHidden = true
        }
        
        // configuring input field
        if config.hasInputField {
            view.inputField.placeholder = config.fieldPlaceholder
        } else {
            view.inputFieldContainerView.isHidden = true
        }
        
        // configuring confirm button
        if let confirmButtonTitle = config.confirmButton {
            view.confirmButton.setTitle(confirmButtonTitle, for: .normal)
        } else {
            view.confirmButtonContainerView.isHidden = true
        }
        
        // configuring dismiss button
        view.dismissButton.setTitle(config.dismissButton, for: .normal)
    }
}
