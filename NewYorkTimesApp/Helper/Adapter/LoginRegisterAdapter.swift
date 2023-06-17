//
//  RegisterAdapter.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 10.06.23.
//

import Foundation
import UIKit
class FileAdapter {
    static let shared = FileAdapter()
    
//
//    if User....standr == true {
//
//        l;l;
//    } else if (UserDefaults....standart == false) {
//        // register
//    }
    
    private func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathComponent("Users.json")
        return path
    }
    
    func writeDataToFile(profiles: [Profile], backCallBack: (() -> Void)? = nil) {
        do {
            let data = try JSONEncoder().encode(profiles)
            try data.write(to: getFilePath())
            backCallBack?()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDataFromFile() -> [Profile] {
        do {
            let data = try Data(contentsOf: getFilePath())
            let profiles = try JSONDecoder().decode([Profile].self, from: data)
            return profiles
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func getProfileImageURL(fileName: String) -> URL {
        let profileImagesDirectory = getDocumentsDirectory().appendingPathComponent("ProfileImages", isDirectory: true)
        let fileURL = profileImagesDirectory.appendingPathComponent(fileName)
        return fileURL
    }
    
    func saveProfileImage(_ image: UIImage, fileName: String) {
        let profileImagesDirectory = getDocumentsDirectory().appendingPathComponent("ProfileImages", isDirectory: true)
        
        do {
            try FileManager.default.createDirectory(at: profileImagesDirectory, withIntermediateDirectories: true, attributes: nil)
            
            let fileURL = profileImagesDirectory.appendingPathComponent(fileName)
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                try imageData.write(to: fileURL)
                print("Profile image saved successfully.")
            }
        } catch {
            print("Failed to save profile image: \(error)")
        }
    }
    
    func loadProfileImage(fileName: String) -> UIImage? {
        let fileURL = getProfileImageURL(fileName: fileName)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            if let imageData = FileManager.default.contents(atPath: fileURL.path) {
                return UIImage(data: imageData)
            }
        }
        
        return nil
    }
}
