//
//  MainView.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//
//
//  MainView.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import SwiftUI

struct MainView: View {
  @StateObject private var viewModel: MainViewModel
  private let baseURL: String = "https://api.sampleapis.com/coffee/hot"
  
  init(viewModel: MainViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    NavigationView {
      VStack {
        if viewModel.isLoading {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
        } else if let errorMessage = viewModel.errorMessage {
          Text(errorMessage)
            .foregroundColor(.red)
            .padding()
        } else {
          List(viewModel.coffeeList, id: \.id) { coffee in
            Text(coffee.title)
          }
        }
      }
      .navigationTitle("Coffees")
      .onAppear {
        viewModel.fetchCoffees(baseURL: baseURL)
      }
    }
  }
}
