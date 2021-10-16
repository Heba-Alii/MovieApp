//
//  MovieCell.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation

class MovieData {
    
    let id: Int
    var imgURL: String
    var title: String
    var subTitle: String?
    var rate: String
    var genre: String?
    var runtime: String?
    var date: String
    var description: String?
    
    init(){
        self.id = 0
        self.imgURL = ""
        self.title = ""
        self.subTitle = nil
        self.rate = ""
        self.genre = nil
        self.runtime = nil
        self.date = ""
        self.description = nil
    }
    
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
