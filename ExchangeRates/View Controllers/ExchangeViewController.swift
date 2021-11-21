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
    self.tableView.reloadData()
    updateTimestamp()
    setupRefreshControl()
     self.tableView.reloadData()
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
extension ExchangeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rateList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "CurrencyCell"
    
    var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
    cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellIdentifier)
    cell.textLabel?.text = rateList[indexPath.row].0 + " - " + rateList[indexPath.row].2
    cell.textLabel?.adjustsFontSizeToFitWidth       = true
    cell.textLabel?.minimumScaleFactor              = 0.6
    cell.detailTextLabel?.text                      = rateList[indexPath.row].3
    cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
    cell.detailTextLabel?.minimumScaleFactor        = 0.6
    return cell
  }
    
    
    
}
