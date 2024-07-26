//
//  BookModel.swift
//  Bookeeping
//
//  Created by MSENSIS on 22/7/24.
//

import Foundation

//struct Book: Decodable {
//    let id: String
//    let title: String
//    let authors: [String]
//    let description: String
//    let thumbnail: String
//}

struct Books: Decodable{
    let kind: String
    let totalItems: Int
    let items: [Items]
}

// Root object of the JSON
struct Items: Decodable, Identifiable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
}

// VolumeInfo object
struct VolumeInfo: Decodable {
    let title: String?
    let authors: [String]?
    let publishedDate: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes?
    let pageCount: Int?
    let printType: String?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink: String?
    let infoLink: String?
    let canonicalVolumeLink: String?
}

// IndustryIdentifier object
struct IndustryIdentifier: Decodable {
    let type: String
    let identifier: String
}

// ReadingModes object
struct ReadingModes: Decodable {
    let text: Bool
    let image: Bool
}

// PanelizationSummary object
struct PanelizationSummary: Decodable {
    let containsEpubBubbles: Bool
    let containsImageBubbles: Bool
}

// ImageLinks object
struct ImageLinks: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
}

// SaleInfo object
struct SaleInfo: Decodable {
    let country: String
    let saleability: String
    let isEbook: Bool
    let buyLink: String?
}

// AccessInfo object
struct AccessInfo: Decodable {
    let country: String?
    let viewability: String?
    let embeddable: Bool?
    let publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub: Epub
    let pdf: Pdf
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?
}

// Epub object
struct Epub: Decodable {
    let isAvailable: Bool?
    let downloadLink: String?
}

// Pdf object
struct Pdf: Decodable {
    let isAvailable: Bool?
    let downloadLink: String?
}
