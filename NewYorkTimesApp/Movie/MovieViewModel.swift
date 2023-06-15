
//  MovieViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 27.05.23.


import Foundation
class MovieViewModel {
    
    var item : Reviews?
    var topmovie = [Result]()
    var successCallback: (()->())?
    
    func getMovie() {
        MovieManager.shared.getMovieItems() { movieData, error in
            if let error = error {
                print( error)
            } else if let movieData = movieData {
                self.topmovie = movieData.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func getMovieSearch(text: String) {
        MovieSearchManager.shared.getMovieSearch(text: text) { movieSearchData, error in
            if let error = error {
                print( error)
            } else if let movieSearchData = movieSearchData {
                self.topmovie = movieSearchData.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func reset () {
        topmovie.removeAll()
        item = nil
    }
    
    func resetDatass() {
        item = nil
        topmovie.removeAll()
    }
}
