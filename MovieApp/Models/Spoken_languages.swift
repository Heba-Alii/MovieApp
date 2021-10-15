//
//  Spoken_languages.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation
struct Spoken_languages : Codable {
    let english_name : String?
    let iso_639_1 : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case english_name = "english_name"
        case iso_639_1 = "iso_639_1"
        case name = "name"
    }

   

}
