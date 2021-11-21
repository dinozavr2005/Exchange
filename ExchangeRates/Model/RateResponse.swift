//
//  RateResponse.swift
//  ExchangeRates
//
//  Created by Владимир on 07.10.2021.
//

import Foundation

struct RatesResponse: Decodable {
  var timestamp: Double
  var rates    : [String : Double]
}
