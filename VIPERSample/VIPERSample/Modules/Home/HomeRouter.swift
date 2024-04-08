//
//  HomeRouter.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import UIKit

protocol PresenterToRouterHomeProtocol: AnyObject {
    static func createModule() -> HomeView
    func pushToHome(navigationConroller:UINavigationController)
}

class HomeRouter: PresenterToRouterHomeProtocol {
     
    static func createModule() -> HomeView {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        let router:PresenterToRouterHomeProtocol = HomeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToHome(navigationConroller navigationController:UINavigationController) {
        
        let convo = HomeRouter.createModule()
        navigationController.pushViewController(convo,animated: true)
        
    }
    
}

