//
//  LoginInterator.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import Foundation

protocol PresenterToInteractorLoginProtocol: AnyObject {
    
    var presenter: InteractorToPresenterLoginProtocol? {get  set}
    func callApi(email: String, password: String)
}

class LoginInteractor: PresenterToInteractorLoginProtocol {
    var presenter:  InteractorToPresenterLoginProtocol?
    
    func callApi(email: String, password: String) {
        // APi Call add here
        self.presenter?.loginApiSuccess(data: LoginModel())
        
    }
    
}
