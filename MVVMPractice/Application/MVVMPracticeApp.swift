//
//  MVVMPracticeApp.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import SwiftUI

@main
struct MVVMPracticeApp: App {
  var body: some Scene {
    WindowGroup {
      let coffeeRepository = DefaultCoffeeRepository()
      let fetchSortedCoffeeUseCase = DefaultFetchSortedCoffeeUseCase(coffeeRepository: coffeeRepository)
      let mainViewModel = MainViewModel(fetchSortedCoffeeUseCase: fetchSortedCoffeeUseCase)
      
      MainView(viewModel: mainViewModel)
    }
  }
}
