//
//  CurrentViewController.swift
//  ExchangeRates
//
//  Created by Владимир on 21.11.2021.
//  Copyright © 2021 Marcy Vernon. All rights reserved.
//

import UIKit
import Charts


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
        
        createChart()
        
    }
    private func createChart() {
        //  Create bar chart
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        
        // Configure the axis
        let xAxis = barChart.xAxis
        let rightAxis = barChart.rightAxis
        
        // Configure legend
        let legend = barChart.legend
        
        // Suply data
        var entries = [BarChartDataEntry]()
        for x in 0..<10 {
            entries.append(
                BarChartDataEntry(
                    x: Double(x),
                    y: Double.random(in: 0...30)
                )
            )
        }
        let set = BarChartDataSet(entries: entries, label: "Cost")
        set.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
        
        view.addSubview(barChart)
        barChart.center = view.center
    }


}
