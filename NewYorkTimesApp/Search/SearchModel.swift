// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Search
struct Search: Codable {
    let status, copyright: String?
    let response: SearchResponse?
}

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let docs: [SearchResult]?
//    let meta: String?
}

// MARK: - SearchResult
struct SearchResult: Codable ,SearchProtocol{
var labeltext: String {
    abstract ?? ""
}
    
    var timetext: String {
        pubDate ?? ""
    }
    
    var imageUrl: String {
        if let multimedia = multimedia, let url = multimedia.first?.url {
            return "https://static01.nyt.com/" + url 
        } else {
            return ""
        }
    }
    
   
    
    let abstract: String?
    let webURL: String?
    let snippet, leadParagraph: String?
    let source: String?
    let multimedia: [SearchMultimedia]?
    let headline: Headline?
    let keywords: [Keyword]?
    let pubDate: String?
    let documentType: DocumentType?
    let newsDesk: String?
    let sectionName: String?
    let subsectionName: String?
    let byline: Byline?
    let id: String?
    let wordCount: Int?
    let uri, typeOfMaterial, printSection, printPage: String?
    
    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case source, multimedia, headline, keywords
        case pubDate = "pub_date"
        case documentType = "document_type"
        case newsDesk = "news_desk"
        case sectionName = "section_name"
        case subsectionName = "subsection_name"
        case byline
        case id = "_id"
        case wordCount = "word_count"
        case uri
        case typeOfMaterial = "type_of_material"
        case printSection = "print_section"
        case printPage = "print_page"
    }
}

// MARK: - Byline
struct Byline: Codable {
    let original: String?
    let person: [Person]?
    let organization: String? //
}

// MARK: - Person
struct Person: Codable {
    let firstname: String?
    let middlename: String?
    let lastname: String?
    let qualifier, title: String?
    let role, organization: String?
    let rank: Int?
}

enum DocumentType: String, Codable {
    case article = "article"
    case multimedia = "multimedia"
}

// MARK: - Headline
struct Headline: Codable {
    let main: String?
    let printHeadline: String?

    enum CodingKeys: String, CodingKey {
        case main
        case printHeadline = "print_headline"
    }
}

// MARK: - Keyword
struct Keyword: Codable {
    let name: String?
    let value: String?
    let rank: Int?
    let major: String?
}

// MARK: - Multimedia
struct SearchMultimedia: Codable {
    let rank: Int?
    let subtype: String?
    let caption, credit: String?
    let type: String?
    let url: String?
    let height, width: Int?
    let legacy: Legacy?
    let subType, cropName: String?

    enum CodingKeys: String, CodingKey {
        case rank, subtype, caption, credit, type, url, height, width, legacy, subType
        case cropName = "crop_name"
    }
}

// MARK: - Legacy
struct Legacy: Codable {
    let xlarge: String?
    let xlargewidth, xlargeheight: Int?
    let thumbnail: String?
    let thumbnailwidth, thumbnailheight, widewidth, wideheight: Int?
    let wide: String?
}
