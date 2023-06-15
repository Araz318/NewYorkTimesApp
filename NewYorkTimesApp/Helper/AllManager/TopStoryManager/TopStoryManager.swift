//
//  TopStoryManager.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
class TopStoryManager {
    static let shared = TopStoryManager()
    
    func getTopStoryItems(category:TopStoryCategory ,completion: @escaping ((TopStory?, String?) -> ())) {
        //        NetworkManager.shared.request(model: TopStory.self,
        //                                      url: TopStoryEndpoint.topstorieshome.path,
        //                                         complete: completion)
        var url = ""
        switch category {
        case .topstoriesarts:
            url = TopStoryEndpoint.topstoriesarts.path
        case .topstorieshome:
            url = TopStoryEndpoint.topstorieshome.path
        case .topstoriesscience:
            url = TopStoryEndpoint.topstoriesscience.path
        case .topstoriesus:
            url = TopStoryEndpoint.topstoriesus.path
        case .topstoriesworld:
            url = TopStoryEndpoint.topstoriesworld.path
        }
        NetworkManager.shared.request(model: TopStory.self, url: url, complete: completion)
    }
    
}


