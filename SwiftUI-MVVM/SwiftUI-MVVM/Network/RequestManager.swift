//
//  RequestManager.swift
//  SwiftUI-MVVM
//
//  Created by Sabih Haris on 3/29/23.
//

import Foundation

final class RequestManager {
    
    static let shared = RequestManager()
    private init() { }
    
    func postData<T:Decodable>(request:URLRequest,resultType:T.Type,completionHandler:@escaping (_ result : T?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if (error == nil && data != nil) {
                let response = try! JSONDecoder().decode(resultType.self, from: data!)
        debugPrint(response)
                _ = completionHandler(response)
            }
        }.resume()
    }
    
    
    
}
