//
//  CountryListController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 26.07.22.
//

import UIKit

class CountryListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var countryModel = [CountryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        title = "Countries"
        jsonSetup()

    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "livescore", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                print(data)
                countryModel = try JSONDecoder().decode([CountryModel].self, from: data)
                print(countryModel)
                tableView.reloadData()
            } catch let error {
                print(String(describing: error))            }
        }
    }
    
}

extension CountryListController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryListCell", for: indexPath) as! CountryListCell
        cell.configureCell(item: countryModel[indexPath.row])
        //test 
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryModel.count
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LigController") as! LigController
        controller.titleText = countryModel[indexPath.row].name
        controller.leagueModel = countryModel[indexPath.row].leagues
            show(controller, sender: nil)
}
}
