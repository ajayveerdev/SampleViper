//
//  ProductRouter.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation
import UIKit

class ProductRouter:PresenterToRouterProtocol{
    func pushToProductDetailsScreen(navigationConroller: UINavigationController,products:ProductEntity) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: Constants.ViewController.productsDetailsViewController) as! ProductsDetailsViewController
        
        nextViewController.products =  products
        navigationConroller.pushViewController(nextViewController, animated: true)
    }
    
    
    static func createModule() -> ProductViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "SampleViewController") as! ProductViewController
        
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ProductPresenter()
        var interactor: PresenterToInteractorProtocol = ProductInteractor()
        let router:PresenterToRouterProtocol = ProductRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
