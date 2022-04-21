//
//  HistoryViewController.swift
//  My Diary
//
//  Created by zein rezky chandra on 06/04/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var historyLists: [HistoryModel] = [HistoryModel(historyDay: "Sunday"),
                                        HistoryModel(historyDay: "Monday"),
                                        HistoryModel(historyDay: "Tuesday"),
                                        HistoryModel(historyDay: "Wednesday"),
                                        HistoryModel(historyDay: "Thursday"),
                                        HistoryModel(historyDay: "Friday"),
                                        HistoryModel(historyDay: "Saturday")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "historyCellID", for: indexPath) as? HistoryCell)!
        cell.historyTitle.text = historyLists[indexPath.row].historyDay
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
