//
//  Production_countries.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation
struct Production_countries : Codable {
    let iso_3166_1 : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case iso_3166_1 = "iso_3166_1"
        case name = "name"
    }


}
