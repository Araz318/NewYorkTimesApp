//
//  FavoriteViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 03.06.23.
//

import Foundation

class FavoriteViewModel {
  
    var items = [TopStoryResult]()
    
    private var adapter = FileManagerAdapter()
    
    func getItems() {
        adapter.readDataFromFile()
        items = adapter.items
    }
    
    func deleteItem(index: Int) {
        adapter.deleteItem(at: index)
        getItems()
    }
    func reset () {
        items.removeAll()
    }
}


