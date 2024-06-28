//
//  AuthManager.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 27/06/24.
//

import Foundation
import FirebaseAuth

struct AuthManager {
    
    let auth = Auth.auth()
    
    enum AuthError: Error {
        case unknownError
    }
    
    func signUpNewUser(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unknownError))
            }
        }
    }
    
    func loginUser(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unknownError))
            }
        }
    }
    
}
