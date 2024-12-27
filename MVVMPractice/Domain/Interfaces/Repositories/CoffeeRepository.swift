//
//  CoffeeRepository.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation

protocol CoffeeRepository {
  @discardableResult
  func fetchCoffeelist(
    completion: @escaping (Result<[CoffeeModel], Error>) -> Void
  ) -> Cancellable?
}
