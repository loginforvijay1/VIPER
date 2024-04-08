//
//  HomeInteractor.swift
//  VIPERSample
//
//  Created by Vemireddy Vijayasimha Reddy on 07/04/24.
//

import Foundation

protocol PresenterToInteractorHomeProtocol: AnyObject {
    var presenter:InteractorToPresenterHomeProtocol? {get set}
    func callApi()
}

class HomeInteractor: PresenterToInteractorHomeProtocol{
    
    var presenter: InteractorToPresenterHomeProtocol?
    
    
    func callApi() {
        let endPoint = "http://universities.hipolabs.com/search?name=middle"
        
        guard let url = URL(string: endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200, data != nil else {
                self.presenter?.homeApiError(errMsg: error?.localizedDescription ?? "")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData =  try decoder.decode([HomeModel].self, from: data!)
                self.presenter?.homeApiSuccess(data: responseData)
            }
            catch let error {
                self.presenter?.homeApiError(errMsg: error.localizedDescription)
                print(error)
            }
        }.resume()
    }
}
