//
//  MovieHelper.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 26.05.23.
//

import Foundation
enum MovieEndpoint: String {
    case movie = "movies/v2/reviews/all.json"
   
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
