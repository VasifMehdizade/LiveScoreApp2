//
//  FavouriteController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 10.08.22.
//

import UIKit

class FavouriteController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}

extension FavouriteController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteViewCell") as! FavouriteViewCell
        return cell
    }
}



