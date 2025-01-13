//
//  DefaultCoffeeRepository.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation
import Alamofire

final class DefaultCoffeeRepository: CoffeeRepository {
  
  @discardableResult
  func fetchCoffeelist(
    baseURL: String,
    completion: @escaping (Result<[CoffeeModel], Error>) -> Void
  ) -> Cancellable? {
    let request = AF.request(baseURL)
      .validate()
      .responseDecodable(of: [CoffeeDTO].self) { response in
        switch response.result {
        case .success(let coffeeDTOList):
          completion(.success(coffeeDTOList.map {
            CoffeeModel(title: $0.title, id: $0.id)
          } ))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    
    return AlamofireCancellable(request: request)
  }
}
