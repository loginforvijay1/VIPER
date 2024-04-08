//
//  LoginPresenter.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import UIKit

protocol InteractorToPresenterLoginProtocol: AnyObject {
    
    func loginApiSuccess(data: LoginModel)
    func loginApiError(errorMsg: String)
}

protocol ViewToPresenterLoginProtocol: AnyObject {
    var view: PresenterToViewLoginProtocol? {get set}
    var interactor: PresenterToInteractorLoginProtocol? {get set}
    var router: PresenterToRouterLoginProtocol? {get set}
    func hitApi()
    func showHomeView(navigationController: UINavigationController)
}

class LoginPresenter: ViewToPresenterLoginProtocol {
    var view: PresenterToViewLoginProtocol?
    
    var router: PresenterToRouterLoginProtocol?
    
    func showHomeView(navigationController: UINavigationController) {
        router?.pushToHome(navigationController: navigationController)
    }
    
    var interactor: PresenterToInteractorLoginProtocol?
    
    func hitApi() {
        interactor?.callApi(email: "", password: "")
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func loginApiSuccess(data: LoginModel) {
        view?.loginApiSuccess(data: data)
    }
    
    func loginApiError(errorMsg: String) {
        view?.loginApiError(errorMsg: errorMsg)
    }
    
}
