//
//  MovieSearchHelper.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 29.05.23.
//

import Foundation
enum MovieSearchEndpoint: String {
    case movie = "movies/v2/reviews/search.json"
   
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
