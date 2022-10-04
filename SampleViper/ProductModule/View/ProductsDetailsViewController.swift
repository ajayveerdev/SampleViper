//
//  ProductsDetailsViewController.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import UIKit

class ProductsDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var products:ProductEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        self.navigationItem.title = Constants.productsDetails
        titleLabel.text = products?.name
        descriptionLabel.text = products?.TestEntityDescription
        let url = URL(string: products?.imageLink ?? "")
        imageView.downloadImage(url: url, view: self.view)
    }
}
