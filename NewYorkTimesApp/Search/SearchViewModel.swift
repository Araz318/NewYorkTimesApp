//
//  SearchViewModel.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 20.05.23.
//

import Foundation
class SearchViewModel {
    var item : Search?
    var search = [SearchResult]()
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    func getSearch(text: String) {
        SearchManager.shared.getSearchItems(text: text) { searchData, error in
            if let error = error {
                self.errorCallback?(error)
            } else if let searchData = searchData {
                self.search = searchData.response?.docs ?? []
                self.successCallback?()
            }
        }
    }
    
    func resetDatas() {
        item = nil
        search.removeAll()
    }
}
