//
//  LoginController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    var profiles = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathComponent("Users.json")
        print(path)
        return path
    }

    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                profiles = try JSONDecoder().decode([Profile].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("file not exist")
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if let email = emailText.text,
           let password = passwordText.text,
           !email.isEmpty, !password.isEmpty
        {
            readDataFromFile()
            
            if profiles.contains(where: { $0.email == email && $0.password == password }) {
                let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(TopStoryController.self)") as! TopStoryController
                navigationController?.show(controller, sender: nil)
            }
            
//            for profile in profiles {
//                if email == profile.email && password == profile.password {
//
//                }
//            }
            
            
        } else {
            print("Sehv melumat daxil etdiniz, tekrar yoxlayin")
        }
    }
}


