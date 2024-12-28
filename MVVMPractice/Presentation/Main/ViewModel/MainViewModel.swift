//
//  MainViewModel.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//
//
//  MainViewModel.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation

final class MainViewModel: ObservableObject {
  @Published var coffeeList: [CoffeeModel] = []
  @Published var isLoading: Bool = true
  @Published var errorMessage: String?
  
  private let fetchSortedCoffeeUseCase: FetchSortedCoffeeUseCase
  private var currentTask: Cancellable?
  
  init(fetchSortedCoffeeUseCase: FetchSortedCoffeeUseCase) {
    self.fetchSortedCoffeeUseCase = fetchSortedCoffeeUseCase
  }
  
  func fetchCoffees(baseURL: String) {
    currentTask?.cancel()
    
    isLoading = true
    errorMessage = nil
    
    currentTask = fetchSortedCoffeeUseCase.execute(baseURL: baseURL) { [weak self] result in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        self.isLoading = false
        
        switch result {
        case .success(let coffeeModels):
          self.coffeeList = coffeeModels
        case .failure(let error):
          self.errorMessage = "오류 발생: \(error.localizedDescription)"
        }
      }
    }
  }
}
