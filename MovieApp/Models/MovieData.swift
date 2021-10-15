//
//  MovieCell.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation

class MovieData {
    
    let id: Int
    let imgURL: String
    let title: String
    let subTitle: String?
    let rate: String
    var genre: String?
    var runtime: String?
    let date: String
    let description: String?
    
    init(id: Int, imgURL: String, title: String, subTitle: String?, rate: String, genre: String?, runtime: String?, date: String, description: String?){
        self.id = id
        self.imgURL = imgURL
        self.title = title
        self.subTitle = subTitle
        self.rate = rate
        self.genre = genre
        self.runtime = runtime
        self.date = date
        self.description = description
    }
}
