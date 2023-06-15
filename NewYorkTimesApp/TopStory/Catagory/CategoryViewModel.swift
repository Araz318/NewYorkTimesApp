//
//  CategoryViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 23.05.23.
//

import Foundation
struct CategoryList {
    let title: String
    let items: [TopStoryResult]
}

class CategoryViewModel {
    var category = [CategoryList]()
    
    var items: [TopStoryCategory] = [.topstoriesarts, .topstorieshome, .topstoriesscience, .topstoriesus, .topstoriesworld]
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
}

