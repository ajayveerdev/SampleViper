//
//  ProductInteractor.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation

class ProductInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func getProductDetails() {
        if Internet.isConnected() == true {
            guard let url = URL(string: Constants.BaseUrl.productsAPI)
            else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, error == nil else {
                    self?.presenter?.productFetchFailed()
                    return
                }
                
                do {
                    let products = try JSONDecoder().decode([ProductEntity].self,from: data)
                    self?.presenter?.productFetchedSuccess(productEntityArray: products)
                } catch {
                    self?.presenter?.productFetchFailed()
                }
            }
            task.resume()
        } else {
            self.presenter?.networkError()
            
        }
    }
}
