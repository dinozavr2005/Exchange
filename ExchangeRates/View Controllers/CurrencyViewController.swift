//
//  CurrentViewController.swift
//  ExchangeRates
//
//  Created by Владимир on 21.11.2021.
//  Copyright © 2021 Marcy Vernon. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    var task1: String?
    var task2: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label1.text = task1
        label2.text = task2
        
    }
    


}
