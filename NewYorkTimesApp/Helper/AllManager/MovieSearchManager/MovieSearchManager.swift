//
//  MovieSearchManager.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 29.05.23.
//

import Foundation
//class MovieSearchManager{
//    static let shared = MovieSearchManager()
//
//    func getMovieSearch (text: String,complete: @escaping ((Reviews?, String?) -> ())) {
//        NetworkManager.shared.request(model: Reviews.self,
//                                      url: MovieSearchEndpoint.movie.path + "&q=\(text)",
//                                      complete: complete)
//    }
//}
class MovieSearchManager {
    static let shared = MovieSearchManager()
    
    func getMovieSearch(text: String, complete: @escaping ((Reviews?, String?) -> ())) {
        NetworkManager.shared.request(model: Reviews.self,
                                      url: MovieSearchEndpoint.movie.path + "&query=\(text)",
                                      complete: complete)
    }
}
