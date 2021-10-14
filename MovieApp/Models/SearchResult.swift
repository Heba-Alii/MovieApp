//
//  SearchResult.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation

struct SearchResult : Codable {
    let page : Int?
    let movies : [Movie]?
    let total_pages : Int?
    let total_results : Int?

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case movies = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}
