//
//  CarSortEnum.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 21.12.22.
//

import Foundation

enum CarSort {
    case BRAND, NAME, COUNTRY, DEFAULT

    func sort(car1: CarModel, car2: CarModel, desc: Bool = false) -> Bool {
        var sortBool = false
        switch self {
        case .BRAND:
            sortBool = car1.brand > car2.brand
        case .NAME:
            sortBool = car1.name > car2.name
        case .COUNTRY:
            if let country1 = car1.country, let country2 = car2.country {
                sortBool = country1 > country2
            }
        case .DEFAULT:
            sortBool = (car1.brand, car1.name) < (car2.brand, car2.name)
        }
        if desc {
            sortBool = !sortBool
        }
        return sortBool
    }
}
