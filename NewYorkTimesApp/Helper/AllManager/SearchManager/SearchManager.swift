//
//  SearchManager.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 20.05.23.
//

import Foundation
class SearchManager {
    static let shared = SearchManager()
    
    func getSearchItems(text: String, complete: @escaping ((Search?, String?) -> ())) {
        NetworkManager.shared.request(model: Search.self,
                                      url: SearchEndpoint.search.path + "&q=\(text)",
                                      complete: complete)
                                     
        }
    
    }

