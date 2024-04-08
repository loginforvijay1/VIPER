//
//  LoginView.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import UIKit
import Combine

protocol PresenterToViewLoginProtocol: AnyObject {
    func loginApiSuccess(data: LoginModel)
    func loginApiError(errorMsg: String)
}

class LoginView: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    
    @Published private var isTncAccepted: Bool = false
    @Published private var username: String = ""
    @Published private var password: String = ""
    
    var presenter: ViewToPresenterLoginProtocol?
    private var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    
    private var signupValidationPublisher: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3( $username, $password, $isTncAccepted)
            .map { username, password, isTncAccepted in
                !username.isEmpty && !password.isEmpty && isTncAccepted }
            .eraseToAnyPublisher()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupValidationPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: signupButton)
            .store(in: &subscriptions)
    }
    
    @IBAction func didChangeUserName(_ sender: UITextField) {
        username = sender.text ?? ""
    }
    
    @IBAction func didChangePassword(_ sender: UITextField) {
        password = sender.text ?? ""
    }
    
    @IBAction func didToggleTncSwitch(_ sender: UISwitch) {
        isTncAccepted = sender.isOn
    }
    
    @IBAction private func didClickOnSubmitButton(_ sender: Any) {
        presenter?.interactor?.callApi(email: username, password: password)
    }
}

extension LoginView: PresenterToViewLoginProtocol {
    func loginApiSuccess(data: LoginModel) {
        presenter?.router?.pushToHome(navigationController: navigationController!)
    }
    
    func loginApiError(errorMsg: String) {
        let alert = UIAlertController(title: "Alert", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true)
    }
}

