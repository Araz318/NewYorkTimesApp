//
//  TopStoryViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
class TopStoryViewModel {
    
    var item : TopStory?
    var topstories = [TopStoryResult]()
    var successCallback: (()->())?
    
    func getTopStory() {
        TopStoryManager.shared.getTopStoryItems() { storyData, error in
            if let error = error {
                print( error)
            } else if let storyData = storyData {
                self.topstories = storyData.results ?? []
                self.successCallback?()
            }
        }
    }
}
