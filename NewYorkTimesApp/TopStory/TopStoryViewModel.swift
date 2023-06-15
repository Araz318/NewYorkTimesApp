//
//  TopStoryViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
struct Category {
    let title: String
    let items: [TopStoryResult]
}

class TopStoryViewModel {
    
    var item :            TopStory?
    var topstories      = [TopStoryResult]()
    var category        = [Category]()
    var successCallback: (()->())?
    
    func getTopStory(category: TopStoryCategory) {
        TopStoryManager.shared.getTopStoryItems(category: category) { storyData, error in
            if let error = error {
                print( error)
            } else if let storyData = storyData {
                self.topstories = storyData.results ?? []
                self.category.append(Category(title: category.rawValue,
                                              items: storyData.results ?? []))
                self.successCallback?()
            }
        }
    }
    func reset () {
        topstories.removeAll()
    }
}
