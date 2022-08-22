//
//  SearchController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 26.07.22.

import UIKit

class SearchController: UIViewController, UISearchResultsUpdating {
    
    var data = ["England", "Turkey", "Azerbaijan", "Spain", "Premier League", " Segunda", "Superliq", "Premyer Liga", "Second Liga", "Championship", "PTT", "La Liga"]
    
    var filterData : [String]!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var searchController = UISearchController()
    
    var originalDataSource : [String] = []
    var currentDataSource : [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        filterData = data
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        filterData = data.filter({$0.starts(with: text) })
        tableview.reloadData()
//        filterData.removeAll()
//        print("Sdf")
//        for wordA in data {
//            if wordA.starts(with: text) {
//                filterData.append(wordA)
//            }
//        }
//        tableview.reloadData()    }
    }
    
    
        
}
extension SearchController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData.removeAll()
        print("Sdf")
        for wordA in data {
            if wordA.starts(with: searchText) {
                filterData.append(wordA)
            }
        }
        tableview.reloadData()
    }
}

extension SearchController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! SearchTableCell
        cell.searchResultLabel.text = filterData[indexPath.row]
        return cell
    }
}
