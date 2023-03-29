//
//  LoginViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Sabih Haris on 3/29/23.
//

import Foundation

class LoginViewModel : ObservableObject {
    
    @Published var userEmail : String = String()
    @Published var password : String = String()
    @Published var errorMessage : String = String()
    @Published var navigate : Bool = false
    @Published var isPresentingErrorAlert : Bool = false
    @Published var isLoading : Bool = true

    private var loginValidaion = LoginValidation()
    private var loginResource = LoginResource()
    
    func validatesInputValues() -> Bool {
        let result = loginValidaion.validatesUserInput(userEmail: userEmail, password: password)
        if result.success == false {
            errorMessage = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    func authnticateUser() {
        self.isLoading = true
        let loginRequest = LoginRequest(userEmail: self.userEmail, userPassword: self.password)
        loginResource.authnticate(loginRequest: loginRequest) { result in
            DispatchQueue.main.async {
                if result?.errorMessage == nil {
                    self.navigate = true
                    self.isLoading = false
                } else {
                    self.errorMessage = result?.errorMessage ?? "error occured"
                    self.isPresentingErrorAlert = true
                    self.isLoading = false
                }
            }
        }
    }
}
