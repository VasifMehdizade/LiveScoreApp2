//
//  LigController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 28.07.22.
//

import UIKit

class LigController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var leagueModel = [LeagueModel]()
    var titleText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .magenta
        title = titleText
    }
}

extension LigController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LigCell", for: indexPath) as! LigCell
        cell.configureCell(item: leagueModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagueModel.count
        
}}
