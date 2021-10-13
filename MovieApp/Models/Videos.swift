//
//  Videos.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation
struct Videos : Codable {
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case results = "results"
    }
}
