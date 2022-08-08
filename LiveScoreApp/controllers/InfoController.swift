//
//  InfoController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 26.07.22.
//

import UIKit

class InfoController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func editButton(_ sender: Any) {
    }
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        let sceneDelegate = SceneDelegate()
        sceneDelegate.navigateToEntryController()
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
}
