//
//  Production_companies.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation
struct Production_companies : Codable {
    let id : Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case logo_path = "logo_path"
        case name = "name"
        case origin_country = "origin_country"
    }

    

}
