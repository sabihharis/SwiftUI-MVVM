//
//  LoginResource.swift
//  SwiftUI-MVVM
//
//  Created by Sabih Haris on 3/29/23.
//

import Foundation

struct LoginResource {
    
    func authnticate(loginRequest:LoginRequest,completionHandler:@escaping(_ result:LoginResponse?) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")!)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try! JSONEncoder().encode(loginRequest)
        
        RequestManager.shared.postData(request: request, resultType: LoginResponse.self) { response in
            _ =  completionHandler(response)
        }
    }
    
}
