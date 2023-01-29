//
//  CarServiceProtocol.swift
//  SAAP_MVVM_CORTIEL
//
//  Created by Jan Cortiel on 05.11.22.
//

protocol CarServiceProtocol {
    func getCarData(fromSource url: String?) async -> (Bool, Cars?, String?)
}
