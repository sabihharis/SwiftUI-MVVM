//
//  LoginValidation.swift
//  SwiftUI-MVVM
//
//  Created by Sabih Haris on 3/29/23.
//

import Foundation

struct ValidationResult {
    var success : Bool = false
    var errorMessage : String?
}

struct LoginValidation {
    func validatesUserInput(userEmail:String,password:String) -> ValidationResult {
        
        if (userEmail.isEmpty || password.isEmpty) {
            return ValidationResult(success: false,errorMessage: "Please enter username and password")
        }
        
        if(isEmailValid(value: userEmail) == false) {
            return ValidationResult(success: false,errorMessage: "Please enter email correctly")

        }
        return ValidationResult(success: true , errorMessage: nil)
    }
    
    func isEmailValid(value:String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
    }
}
