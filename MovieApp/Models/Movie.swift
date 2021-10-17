//
//  Movie.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

struct Movie : Codable {
    let adult : Bool?
    let backdrop_path : String?
    let budget : Int?
    let genreIds : [Int]?
    let genres : [Genres]?
    let homepage : String?
    let id : Int
    let imdb_id : String?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let production_companies : [Production_companies]?
    let production_countries : [Production_countries]?
    let release_date : String?
    let revenue : Int?
    var runtime : Int?
    let spoken_languages : [Spoken_languages]?
    let status : String?
    let tagline : String?
    let title : String!
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    let videos : Videos?
    let credits : Credits?
    
    enum CodingKeys: String, CodingKey {

        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case budget = "budget"
        case genreIds = "genreIds"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case production_companies = "production_companies"
        case production_countries = "production_countries"
        case release_date = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spoken_languages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
        case videos = "videos"
        case credits = "credits"
    }
}
