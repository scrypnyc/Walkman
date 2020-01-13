//
//  SearchModel.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 06.12.2019.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import Foundation


struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
    
}
