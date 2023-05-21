
import Foundation


struct TopStory: Codable {
    let status, copyright, section: String?
    let lastUpdated: String?
    let numResults: Int?
    let results: [TopStoryResult]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

struct TopStoryResult: Codable, TopStoryProtocol {
    
    var abstracttext: String {
        abstract ?? ""
    }
    
    var timetext: String {
        updatedDate ?? ""
    }
    
    var texttext: String {
        title ?? ""
    }
    
    var imageUrl: String {
        if let multimedia = multimedia, let url = multimedia.first?.url {
            return url
        } else {
            return ""
        }
    }
    
    let section, subsection, title, abstract: String?
    let url: String?
    let uri, byline: String?
    let itemType: String?
    let updatedDate, createdDate, publishedDate: String?
    let materialTypeFacet, kicker: String?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let multimedia: [Multimedia]?
    let shortURL: String?
    
    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

struct Multimedia: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
    let type: String?
    let subtype: String?
    let caption, copyright: String?
}
