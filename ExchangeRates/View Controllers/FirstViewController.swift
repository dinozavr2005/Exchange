//
//  FirstViewController.swift
//  ExchangeRates
//
//  Created by Владимир on 07.10.2021.
//

import UIKit

class FirstViewController: UIViewController {
  
  private var dataModel = ExchangeDataModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    dataModel.getLatestRates()

  }

    @IBAction func getRates(_ sender: UIButton) {
        performSegue(withIdentifier: "toExchange", sender: self)
    }
}
