//
//  RegisterViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 17.05.23.
//

import Foundation
class RegisterViewModel {
    static let shared = RegisterViewModel()
    var profiles = [Profile]()
    var backCallBack: (()->())?
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathComponent("Users.json")
        print(path)
        return path
    }
    
    func writeToJsonFile() {
        do {
            let data = try JSONEncoder().encode(profiles)
            try data.write(to: getFilePath())
            self.backCallBack?()
        } catch {
            print(error.localizedDescription)
        }
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
}
