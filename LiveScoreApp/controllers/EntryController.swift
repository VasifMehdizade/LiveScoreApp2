//
//  EntryController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 25.07.22.
//

import UIKit

class EntryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let delay : Double = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.fireTimer()
        }

                   }
    @objc func fireTimer() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        show(controller, sender: nil)
    }


}
