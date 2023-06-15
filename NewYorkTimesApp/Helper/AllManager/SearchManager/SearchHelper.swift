//
//  SearchHelper.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 20.05.23.
//

import Foundation
enum SearchEndpoint: String {
    case search = "search/v2/articlesearch.json"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
