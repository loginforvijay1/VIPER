//
//  LoginRouter.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import UIKit

protocol PresenterToRouterLoginProtocol: AnyObject {
    static func createModule() -> LoginView
    func pushToHome(navigationController: UINavigationController)
}

class LoginRouter: PresenterToRouterLoginProtocol {
    static func createModule() -> LoginView {
        guard let view = mainstoryboard.instantiateViewController(withIdentifier: "LoginView") as? LoginView else {return LoginView() }
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        let interactor: PresenterToInteractorLoginProtocol = LoginInteractor()
        let router: PresenterToRouterLoginProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    func pushToHome(navigationController: UINavigationController) {
        let homeVC = HomeRouter.createModule()
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
