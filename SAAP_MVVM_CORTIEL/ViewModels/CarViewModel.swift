//
//  CarModelView.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 15.11.22.
//

import Foundation

protocol CarViewModelListener {
    func notifyUI()
}

class CarViewModel: NSObject {
    var sort = CarSort.DEFAULT
    private var cars = Cars() {
        didSet {
            sortedCars = cars
        }
    }

    private(set) var sortedCars = Cars() {
        didSet {
            sortedCars.sort(by: { sort.sort(car1: $0, car2: $1) })
            delegate?.notifyUI()
        }
    }

    var delegate: CarViewModelListener?

    private let carModelService: CarServiceProtocol

    init(carModelService: CarServiceProtocol = MockCarService()) {
        self.carModelService = carModelService
    }
    
    func selectModel(by index: Int) -> CarModel? {
        if index >= 0 && index < sortedCars.count {
            return sortedCars[index]
        }
        return nil
    }

    func updateData() {
        Task.detached(priority: .userInitiated) {
            let (success, cars, error) = await self.carModelService.getCarData(fromSource: nil)
            if let error {
                print("Error: \(error)")
            }
            if success, let cars {
                self.cars = cars
            }
        }
    }

    func searchFor(car searchTerm: String) {
        let searchTerm = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        sortedCars = searchTerm.isEmpty ? cars : cars.filter({ $0.name.lowercased().contains(searchTerm) || $0.brand.lowercased().contains(searchTerm) || $0.country?.lowercased().contains(searchTerm) ?? false })
    }
    
    func cancelSearch() {
        sortedCars = cars
    }
}
