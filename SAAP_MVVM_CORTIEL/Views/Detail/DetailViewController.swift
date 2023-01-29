//
//  DetailViewController.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 21.12.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var carViewModel: CarViewModel?
    
    private var carIndex: Int = -1
    
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    override func viewDidLoad() {
        if carIndex >= 0, let car = carViewModel?.selectModel(by: carIndex) {
            brandLabel.text = car.brand
            modelLabel.text = car.name
            countryLabel.text = car.country ?? "Not given"
            releaseYearLabel.text = "\(car.year)"
            if let carImagePath = car.imagePath, let image = UIImage(named: carImagePath) {
                carImageView.image = image
            } else {
                carImageView.removeFromSuperview()
            }
        }
    }
    
    func setViewModel(viewModel: CarViewModel) {
        self.carViewModel = viewModel
    }
    
    func setCarIndex(index: Int) {
        self.carIndex = index
    }
}
