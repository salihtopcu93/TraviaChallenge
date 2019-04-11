//
//  WinnersViewController.swift
//  Trivia Challange
//
//  Created by salih topcu on 11.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import UIKit

class WinnersViewController: UIViewController {

    
    @IBOutlet weak var winnerGetsLabel: UILabel!
    @IBOutlet weak var totalWinnerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel : WinnersViewModel!
    
    func configureModel() {
        self.viewModel = WinnersViewModel.init()
        self.viewModel.delegate = self as WinnersViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureModel()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureView() {
        let winnerResult = viewModel.result?.winnersGet
        winnerGetsLabel.text = "\(String(describing: winnerResult ?? 0.0)) TL"
        
    }

}

extension WinnersViewController: WinnersViewDelegate {
    func winnerUpdatedList() {
        configureView()
        tableView.reloadData()
    }
}

extension WinnersViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.result?.winnersNames.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WinnersTableViewCell
        cell.setView(result: (viewModel.result?.winnersNames[indexPath.row])!)
        return cell
    }
    
    
}

