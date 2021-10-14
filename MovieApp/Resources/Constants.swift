//
//  Constants.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation

struct Constants {
    
    static let appName = "Movies App"
    static let BASE_URL = "https://api.themoviedb.org/"
    static let SEARCH_MOVIES = "3/search/movie"
    static let APIKEY = "112e4a60455675fcc2e069b755f8e1bf"
    static let IMAGE_BASE = "https://image.tmdb.org/t/p/original"
    
    struct Cells {
        static let movieCell = "MovieCell"
    }
    
    struct API_Parms_KEYS {
        static let api_key = "api_key"
        static let query = "query"
        static let page = "page"
    }
}
