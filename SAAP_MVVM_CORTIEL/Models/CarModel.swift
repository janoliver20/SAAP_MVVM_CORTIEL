//
//  CarModel.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 05.11.22.
//

typealias Cars = [CarModel]

struct CarModel: Codable {
    let name: String
    let brand: String
    let year: Int
    var imagePath: String? = nil
    var country: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case name
        case brand
        case country
        case year
        case imagePath
    }
}

