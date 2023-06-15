//
//  FileManagerAdapter.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 01.06.23.
//
//

import Foundation

class FileManagerAdapter {
    
    var items = [TopStoryResult]()
       
    func isItemFavorite(_ item: TopStoryResult) -> Bool {
        return items.contains(where: { $0.title == item.title })
    }


    func deleteItem(at index: Int) {
        guard index >= 0, index < items.count else {
            print("Invalid index")
            return
        }

        items.remove(at: index)
        saveDataToFile()
    }
   
    func saveDataToFile() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: getFilePath(), options: .atomic)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func writeToJsonFile(item: TopStoryResult) {
        readDataFromFile()
        items.append(item)
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                items = try JSONDecoder().decode([TopStoryResult].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found ")
        }
    }
    
    func getFilePath() -> URL {
        let paths        = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path         = docDirectory.appendingPathComponent("Favorit.json")
        return path
    }
}
