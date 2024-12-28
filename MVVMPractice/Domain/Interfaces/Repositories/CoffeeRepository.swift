//
//  CoffeeRepository.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation

import Alamofire

protocol CoffeeRepository {
  @discardableResult
  func fetchCoffeelist(
    baseURL: String,
    completion: @escaping (Result<[CoffeeModel], Error>) -> Void
  ) -> Cancellable?
}

