//
//  CoffeeModel.swift
//  MVVMPractice
//
//  Created by 송여경 on 12/27/24.
//

import Foundation

struct CoffeeModel: Decodable {
  let title: String
  let description: String
  let ingredients: [String]
  let image: String
  let id: Int
}

