//
//  RegisterController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    let viewModel = RegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.readDataFromFile()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if let fullname = nameText.text, !fullname.isEmpty,
           let email = emailText.text, !email.isEmpty,
           let password = passwordText.text, !password.isEmpty {
            var profile = Profile(fullname: fullname, email: email, password: password)
            viewModel.profiles.append(profile)
            viewModel.writeToJsonFile()
            viewModel.backCallBack = {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    
    
}
