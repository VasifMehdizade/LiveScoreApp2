//
//  LoginController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 25.07.22.
//
import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var notRegisteredButton: UIButton!
   
    var users = [Users]()
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    var jsonData = URL(string: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        notRegistered()
        errorLabel.isHidden = true
        jsonData = getDocumentDirectoryUrl().appendingPathComponent("Users.json")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        jsonSetup()
    }
    
    func notRegistered () {
        let attributeString = NSMutableAttributedString(
            string: "Not registered?",
            attributes: yourAttributes)
        notRegisteredButton.setAttributedTitle(attributeString, for: .normal)
    }
    
    func getDocumentDirectoryUrl() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func jsonSetup() {

        if let file = jsonData, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([Users].self, from: data)
                print(getDocumentDirectoryUrl())
            } catch {
                print(error)
                print(getDocumentDirectoryUrl())
            }
        }
    }
    
    func check() -> Bool {
        for user in users {
            if emailText.text == user.email &&  passwordText.text == user.password {
                return true
            }
        }
        print(getDocumentDirectoryUrl())
        return false

    }
    
    func navigateToHomeScreen() {
        if check() {
            print("done")
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            show(controller, sender: nil)
        } else {
            print("kjb")
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        navigateToHomeScreen()
    }
    
    @IBAction func notRegisteredAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        show(controller, sender: nil)
    }
}
