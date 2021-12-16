//
//  ExchangeViewController.swift
//  ExchangeRates
//
//  Created by Владимир on 07.10.2021.
//

import UIKit

class ExchangeViewController: UIViewController {
  
  private var dataModel = ExchangeDataModel()
  private let dateTitlePrefix = "Rates last updated: "
  private let dateTitleError  = "Rates not updated"
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var lblTimestamp: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self

    updateTimestamp()
    setupRefreshControl()

  }
  
//MARK: - Refresh Data Methods
  private func setupRefreshControl() {
    let refreshControl = UIRefreshControl()
    refreshControl.layer.zPosition = -99
    refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh Data",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    tableView.refreshControl = refreshControl
  }
  
  @objc func refreshData(refreshControl: UIRefreshControl) {
    dataModel.getLatestRates()
    updateTimestamp()
    refreshControl.endRefreshing()
    updateTimestamp()
  }
  
  private func updateTimestamp() {
    lblTimestamp.text = timeStamp != "" ? dateTitlePrefix + timeStamp : dateTitleError
  }
}

//MARK: - Table Methods

extension ExchangeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      tableView.deselectRow(at: indexPath, animated: true)
    
        let vc = storyboard?.instantiateViewController(identifier: "task") as! CurrencyViewController
        vc.title = "Currency"
        vc.currencyName = rateList[indexPath.row].0 + " - " + rateList[indexPath.row].2
        vc.currencyValue = rateList[indexPath.row].3
        vc.currencyCost = rateList[indexPath.row].1
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ExchangeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rateList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "CurrencyCell"
    
    var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
      
    cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellIdentifier)
      
    cell.textLabel?.text = rateList[indexPath.row].0 + " - " + rateList[indexPath.row].2

    cell.detailTextLabel?.text = rateList[indexPath.row].3

    return cell
  }
}

