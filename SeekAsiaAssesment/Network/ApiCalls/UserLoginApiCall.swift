//
//  UserLogin.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//

import Foundation
import BaseAPI

protocol LoginApiService {
    func login(username: String, password: String, onCompletion: @escaping NetworkServiceCompletion<LoginModel>)
}

class UserLoginApiCall: LoginApiService {
    func login(username: String, password: String, onCompletion: @escaping NetworkServiceCompletion<LoginModel>) {
        let mutation = AuthMutation(username: username, password: password)
        
        Network.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data, let auth = data.auth {
                    let authUser = LoginModel(auth: auth)
                    onCompletion(authUser, nil)
                } else if let errors = graphQLResult.errors, let error = errors.first {
                    onCompletion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription]))
                } else {
                    onCompletion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"]))
                }
            case .failure(let error):
                onCompletion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription]))
            }
        }
    }
}
