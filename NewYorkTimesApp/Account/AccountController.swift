//
//  AccountController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 08.06.23.
//

import UIKit

class AccountController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    var profile: Profile?
    
    private let imagePicker = UIImagePickerController()
    
    private var profileImage : UIImage?
    
    let viewModel = ViewModel.shared
    let fileAdapter = FileAdapter.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAccountInfo()
        configureUI()
        loadProfileImage()
        configureImagePicker()
    }
    func configureUI() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    func updateAccountInfo() {
        if let loggedInName = UserDefaults.standard.string(forKey: "loggedInName"),
           let loggedInEmail = UserDefaults.standard.string(forKey: "loggedInEmail") {
            nameLabel.text = loggedInName
            emailLabel.text = loggedInEmail
        }
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        showLogoutAlert {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = scene.delegate as? SceneDelegate {
                UserDefaults.standard.set(false, forKey: "loggedIn")
                sceneDelegate.setLoginRootController(windowScene: scene)
            }
        }
    }
    func configureImagePicker() {
        profilePhoto.layer.cornerRadius = 60
        profilePhoto.layer.masksToBounds = true
        profilePhoto.layer.borderColor = UIColor.red.cgColor
        profilePhoto.layer.borderWidth = 3
    }
    func loadProfileImage() {
        if let loggedInEmail = UserDefaults.standard.string(forKey: "loggedInEmail") {
            let fileName = "\(loggedInEmail)_profile.jpg"
            if let image = fileAdapter.loadProfileImage(fileName: fileName) {
                self.profilePhoto.image = image.withRenderingMode(.alwaysOriginal)
            }
        }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: - ImagePickerController

extension AccountController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        configureImagePicker()
        self.profilePhoto.image = profileImage.withRenderingMode(.alwaysOriginal)
        dismiss(animated: true, completion: nil)
        if let loggedInEmail = UserDefaults.standard.string(forKey: "loggedInEmail") {
            let fileName = "\(loggedInEmail)_profile.jpg"
            fileAdapter.saveProfileImage(profileImage, fileName: fileName)
        }
    }
}
