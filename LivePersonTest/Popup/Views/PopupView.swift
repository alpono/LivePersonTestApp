//
//  PopupView.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/25/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import UIKit

protocol PopupViewDelegate: class {
    func confirmButtonDidTap()
    func dismissButtonDidTap()
}

class PopupView: IBDesignableView {

    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var inputFieldContainerView: UIView!
    @IBOutlet var inputField: UITextField!
    @IBOutlet var confirmButtonContainerView: UIView!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var dismissButton: UIButton!
    
    weak var delegate: PopupViewDelegate?
    
    @IBAction func confirmDidTap(_ sender: Any) {
        if let delegate = delegate {
            delegate.confirmButtonDidTap()
        }
    }
    @IBAction func dismissDidTap(_ sender: Any) {
        if let delegate = delegate {
            delegate.dismissButtonDidTap()
        }
    }
}
