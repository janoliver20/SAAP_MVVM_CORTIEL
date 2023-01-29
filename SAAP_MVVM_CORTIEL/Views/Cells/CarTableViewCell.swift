//
//  CarTableViewCell.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 05.11.22.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carBrandLabel: UILabel!
    @IBOutlet weak var carNameLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        initCell()
    }
    
    
    func initCell() {
        backgroundColor = .clear
        
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
        
    func setCarIndex(with viewModel: CarViewModel, index: Int) {
        if let car = viewModel.selectModel(by: index) {
            self.carBrandLabel.text = car.brand
            self.carNameLabel.text = car.name
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carNameLabel.text = nil
    }
    
    
}
