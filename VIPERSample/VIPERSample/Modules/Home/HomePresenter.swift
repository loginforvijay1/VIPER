//
//  HomePresenter.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import UIKit

protocol InteractorToPresenterHomeProtocol: AnyObject {
    func homeApiSuccess(data: [HomeModel])
    func homeApiError(errMsg: String)
}

protocol ViewToPresenterHomeProtocol: AnyObject{
    
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func hitApi()
    func showNextView(navigationController:UINavigationController)

}

class HomePresenter:ViewToPresenterHomeProtocol {
    var view: PresenterToViewHomeProtocol?
    
    var interactor: PresenterToInteractorHomeProtocol?
    
    var router: PresenterToRouterHomeProtocol?
    
    func hitApi() {
        interactor?.callApi()
    }
    
    func showNextView(navigationController: UINavigationController) {
        router?.pushToHome(navigationConroller:navigationController)
    }

}

extension HomePresenter: InteractorToPresenterHomeProtocol{
    
    func homeApiSuccess(data: [HomeModel]) {
        view?.homeApiSuccess(data: data)
    }
    
    func homeApiError(errMsg: String) {
        view?.homeApiError(errMsg: errMsg)
    }
    
    
}
