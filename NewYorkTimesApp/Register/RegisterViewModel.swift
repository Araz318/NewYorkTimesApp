//
//  RegisterViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 17.05.23.
//

import Foundation
class ViewModel {
    static let shared = ViewModel()
    var profiles = [Profile]()
    var backCallBack: (() -> Void)?
    let fileAdapter = FileAdapter.shared
    
    func userExist(email: String) -> Bool {
        readDataFromFile()
        if profiles.contains(where: { $0.email == email }) {
            return true
        } else {
            return false
        }
    }
    
    func writeDataToFile()  {
        fileAdapter.writeDataToFile(profiles: profiles, backCallBack: backCallBack)
    }
    
    func readDataFromFile() {
        profiles = fileAdapter.readDataFromFile()
    }
    
    func isEmailRegistered(email: String) -> Bool {
        return profiles.contains { $0.email == email }
    }
    
    func registerUser(profile: Profile) -> Bool {
        let isRegistered = isEmailRegistered(email: profile.email)
        if !isRegistered {
            profiles.append(profile)
            return true
        }
        return false
    }
    
    func validateLogin(email: String, password: String) -> Bool {
        return profiles.contains { $0.email == email && $0.password == password }
    }
    
    func getProfile(email: String) -> Profile? {
        return profiles.first { $0.email == email }
    }
}
