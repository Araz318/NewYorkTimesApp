//
//  Review.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 25.05.23.
//

import Foundation

// MARK: - Reviews
struct Reviews: Codable {
    let status, copyright: String?
    let hasMore: Bool?
    let numResults: Int?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case hasMore = "has_more"
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable,MovieProtocol {
    var timetext: String {
        publicationDate ?? ""
    }
    
    var ratingtext: String {
        mpaaRating ?? ""
    }
    
    var imageUrl: String {
        if let multimedia = multimedia, let url = multimedia.src {
            return url
        } else {
            return ""
        }
    }
    
    var titletext: String {
        displayTitle ?? ""
    }
    
    var bylinetext: String {
        byline ?? ""
    }
    
    var sumaryshorttext: String {
        summaryShort ?? ""
    }
    
    let displayTitle: String?
    let mpaaRating: String?
    let criticsPick: Int?
    let byline, headline, summaryShort, publicationDate: String?
    let openingDate, dateUpdated: String?
    let link: Link?
    let multimedia: ReviewMultimedia?
    
    enum CodingKeys: String, CodingKey {
        case displayTitle = "display_title"
        case mpaaRating = "mpaa_rating"
        case criticsPick = "critics_pick"
        case byline, headline
        case summaryShort = "summary_short"
        case publicationDate = "publication_date"
        case openingDate = "opening_date"
        case dateUpdated = "date_updated"
        case link, multimedia
    }
}

// MARK: - Link
struct Link: Codable {
    let type: String?
    let url: String?
    let suggestedLinkText: String?
    
    enum CodingKeys: String, CodingKey {
        case type, url
        case suggestedLinkText = "suggested_link_text"
    }
}

// MARK: - Multimedia
struct ReviewMultimedia: Codable {
    let type: String?
    let src: String?
    let height, width: Int?
}
