//
//  CarService.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 05.11.22.
//

import Foundation

class MockCarService: CarServiceProtocol {
    func getCarData(fromSource url: String?) async -> (Bool, Cars?, String?) {
        let cars = [
            CarModel(name: "M3", brand: "BMW", year: 2021, imagePath: "bmw_m3", country: "Germany"),
            CarModel(name: "M5 Touring", brand: "BMW", year: 2021, imagePath: "bmw_m5_touring", country: "Germany"),
            CarModel(name: "RS6", brand: "Audi", year: 2019, imagePath: "audi_rs6", country: "Germany"),
            CarModel(name: "Golf GTI", brand: "Volkswagen", year: 2020, imagePath: "golf_gti", country: "Germany"),
            CarModel(name: "Chiron", brand: "Bugatti", year: 2016, imagePath: "bugatti_chiron", country: "France"),
            CarModel(name: "Giulia SWB Zagato", brand: "Alfa Romeo", year: 2022, imagePath: "alfa_romero_giulia_swb_zagato", country: "Italy")
        ]
        return (true, cars, nil)
    }
}
