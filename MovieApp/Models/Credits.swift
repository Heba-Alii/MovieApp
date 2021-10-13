//
//  Credits.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation
struct Credits : Codable {
    let cast : [Cast]?
    let crew : [Crew]?

    enum CodingKeys: String, CodingKey {

        case cast = "cast"
        case crew = "crew"
    }

   

}
