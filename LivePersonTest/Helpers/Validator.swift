//
//  Validator.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/25/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import Foundation

protocol InputValidator {
    func validate(inputText: String?, completion: @escaping (Bool) -> Void)
}

class EmailValidatorMock: InputValidator {
    func validate(inputText: String?, completion: @escaping (_ valid: Bool) -> Void) {
        completion(true)
    }
}
