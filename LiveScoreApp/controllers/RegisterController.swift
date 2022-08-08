//
//  RegisterController.swift
//  LiveScoreApp
//
//  Created by Vasif Mehdizade on 25.07.22.
//

import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var surnameErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var genderErrorLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var emailRegisterText: UITextField!
    @IBOutlet weak var passwordRegisterText: UITextField!
    @IBOutlet weak var genderText: UITextField!
   
    var genders = ["male", "female"]
    var pickerView = UIPickerView()
    var users = [Users]()
    
    var jsonFile = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        genderText.inputView = pickerView
        
        jsonFile = getDocumentDirectoryUrl().appendingPathComponent("Users.json")
        
        title = "Registration"
        jsonSetup()
    }
    
    func getDocumentDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func jsonSetup() {
        if let file = jsonFile, let data = try? Data(contentsOf: file) {
            do {
                users = try JSONDecoder().decode([Users].self, from: data)
            }catch{
                print(error.localizedDescription)
                print("vas")
            }
        }else{
            print("error")
        }
    }
    
    func writeToFile() {
        let user = Users(name: nameText.text!, surname: surnameText.text!, email: emailRegisterText.text!, password: passwordRegisterText.text!, gender: genderText.text!)
        users.append(user)
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: jsonFile!)
            navigationController?.popViewController(animated: true)

        }catch{
            print("sth")
        }
    }
    
    @IBAction func signupAction(_ sender: Any) {
        
        if nameText.text?.isEmpty == false && surnameText.text?.isEmpty == false && emailRegisterText.text?.isEmpty == false && passwordRegisterText.text?.isEmpty == false && genderText.text?.isEmpty == false {
            writeToFile()

        }else {
            print("Not working")
        }
    
    }
    @IBAction func alreadyAccountAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        show(controller, sender: nil)
    }
}

extension RegisterController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderText.text = genders[row]
        genderText.resignFirstResponder()
    }
}
