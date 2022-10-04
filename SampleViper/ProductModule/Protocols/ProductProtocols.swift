//
//  ProductProtocols.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingProduct()
    func showProductDetailsController(navigationController:UINavigationController,products:ProductEntity)
    
}

protocol PresenterToViewProtocol{
    func showProduct(productArray:Array<ProductEntity>)
    func showError()
    func showNetworkError()
}

protocol PresenterToRouterProtocol {
    static func createModule()-> ProductViewController
    func pushToProductDetailsScreen(navigationConroller:UINavigationController,products:ProductEntity)
}

protocol PresenterToInteractorProtocol {
    var presenter:InteractorToPresenterProtocol? {get set}
    func getProductDetails()
}

protocol InteractorToPresenterProtocol {
    func productFetchedSuccess(productEntityArray:Array<ProductEntity>)
    func productFetchFailed()
    func networkError()
}
