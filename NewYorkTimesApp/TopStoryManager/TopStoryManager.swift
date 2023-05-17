//
//  TopStoryManager.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 15.05.23.
//

import Foundation
class TopStoryManager {
    static let shared = TopStoryManager()
    
    func getTopStoryItems(completion: @escaping ((TopStory?, String?) -> ())) {
        NetworkManager.shared.request(model: TopStory.self,
                                      url: TopStoryEndpoint.topstories.path,
                                         complete: completion)

      }
}

