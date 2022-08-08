//
//  HomePageController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 25.07.22.
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var model = [Matches]()
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
        title = "Live matches"
        jsonSetup()
    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "matches", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
//                print(data)
                model = try JSONDecoder().decode([Matches].self, from: data)
//                print(model)
                collectionView.reloadData()
            } catch let error {
                print(String(describing: error))            }
        }
    }
}

extension HomePageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        cell.homeTeamLabel.text = model[indexPath.item].homeTeam
        cell.rivalLabel.text = model[indexPath.item].rival
        cell.homeTeamScoreLabel.text = model[indexPath.item].firstScore
        cell.rivalTeamScoreLabel.text = model[indexPath.item].secondScore

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 0.96, height: 100)
    }
    
    
    }
