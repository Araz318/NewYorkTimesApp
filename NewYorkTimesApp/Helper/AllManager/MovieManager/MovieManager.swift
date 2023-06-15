//
//  MovieManager.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 26.05.23.
//

import Foundation
class MovieManager{
    static let shared = MovieManager()
    
    func getMovieItems( complete: @escaping ((Reviews?, String?) -> ())) {
        NetworkManager.shared.request(model: Reviews.self,
                                      url: MovieEndpoint.movie.path,
                                      complete: complete)
    }
}
