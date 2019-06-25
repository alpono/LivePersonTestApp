//
//  PopupViewController.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/24/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController, PopupViewDelegate {
    
    @IBOutlet var popupView: PopupView! {
        didSet {
            self.popupView.delegate = self
        }
    }
    var viewModel: PopupViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(view: popupView)
    }
    
    func confirmButtonDidTap() {
        let validator = EmailValidatorMock()
        validator.validate(inputText: popupView.inputField.text) { [weak self] (valid: Bool) in
            guard let self = self else {
                return
            }
            if valid == true {
                self.dismiss(animated: true, completion: {
                    PopupManager.shared.emailProvided()
                })
            } else {
                // out of task scope
            }
        }
    }
    
    func dismissButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }

}

