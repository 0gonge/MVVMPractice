//
//  FetchSortedCoffeeUseCase.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation

protocol FetchSortedCoffeeUseCase {
  func execute(baseURL: String, completion: @escaping (Result<[CoffeeModel], Error>) -> Void) -> Cancellable?
}

final class DefaultFetchSortedCoffeeUseCase: FetchSortedCoffeeUseCase {
  
  private let coffeeRepository: CoffeeRepository
  
  init(coffeeRepository: CoffeeRepository) {
    self.coffeeRepository = coffeeRepository
  }
  
  func execute(baseURL: String, completion: @escaping (Result<[CoffeeModel], Error>) -> Void) -> Cancellable? {
      return coffeeRepository.fetchCoffeelist(baseURL: baseURL) { result in
        switch result {
        case .success(let coffeeModels):
          let filteredCoffees = coffeeModels.filter {
            let lowercasedTitle = $0.title.lowercased()
            return lowercasedTitle.contains("latte")
          }
          completion(.success(filteredCoffees))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    }
}
