//
//  Cancellable.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation

import Alamofire

protocol Cancellable {
  func cancel()
}

final class AlamofireCancellable: Cancellable {
  private var request: DataRequest?
  
  init(request: DataRequest?) {
    self.request = request
  }
  
  func cancel() {
    request?.cancel()
  }
}
