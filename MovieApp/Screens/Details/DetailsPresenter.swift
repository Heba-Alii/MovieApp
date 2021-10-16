//
//  DetailsPresenter.swift
//  MovieApp
//
//  Created by Heba on 15/10/2021.
//

import Foundation
class DetailsPresenter {
    
    func formatMovie(movie : Movie) -> DetailsData {
        let detailsData = DetailsData()
        
        if let posterpath = movie.poster_path {
            detailsData.imgURL = Constants.IMAGE_BASE + posterpath
        } else {
            detailsData.imgURL = "https://via.placeholder.com/150"
        }
        
        detailsData.title = movie.title
        
        if let movieRate = movie.vote_average {
            detailsData.rate = String(describing: movieRate).replacingOccurrences(of: ".", with: ",")
        }
        
        if let date = movie.release_date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: date){
                dateFormatter.dateFormat = "dd/MM/yyyy"
                detailsData.date = dateFormatter.string(from: date)
            }
            
            if let date = dateFormatter.date(from: date){
                dateFormatter.dateFormat = "yyyy"
                detailsData.movieYear = dateFormatter.string(from: date)
            }
        }
        
        if let crews = movie.credits?.crew {
            for crew in crews {
                if let job = crew.job, (job == "Director" || job == "Story") {
                    
                    if job == "Director" {
                        detailsData.directorName = crew.original_name ?? ""
                        detailsData.directorJobs = "Director"
                    }
                    
                    if job == "Story" {
                        detailsData.storyName = crew.original_name ?? ""
                        detailsData.storyJobs = "Story"
                    }
                }
            }
            
            for crew in crews {
                
                if let name = crew.original_name,
                   (name == detailsData.directorName || name == detailsData.storyName),
                    (crew.job != "Director" && crew.job != "Story") {
                    
                    if let job = crew.job, name == detailsData.directorName {
                        detailsData.directorJobs += ", " + job
                    }
                    
                    if let job = crew.job, name == detailsData.storyName {
                        detailsData.storyJobs += ", " + job
                    }
                }
            }
        }
        
        if let runtime = movie.runtime {
            let h = runtime / 60
            let m = runtime - (h * 60)
            
            if(h == 0 && m == 0){
                detailsData.runtime = nil
            } else if(h == 0){
                detailsData.runtime = "\(m)m"
            } else {
                detailsData.runtime = "\(h)h \(m)m"
            }
        }
        
        if let generes = movie.genres, !generes.isEmpty {
            detailsData.genre = generes[0].name
        }
        
        if let genre = detailsData.genre {
            detailsData.movieDescription = genre
        }
        
        if let run = detailsData.runtime {
            if detailsData.movieDescription.isEmpty
            {
                detailsData.movieDescription = run
            } else {
                detailsData.movieDescription += " | " + run
            }
        }
        
        if detailsData.movieDescription.isEmpty
        {
            detailsData.movieDescription = detailsData.date
        } else {
            detailsData.movieDescription += " | " + detailsData.date
        }
        
        detailsData.videoOverView = movie.overview ?? ""
        
        if let videos = movie.videos?.results {
            for video in videos {
                if let key = video.key, video.site == "YouTube" {
                    detailsData.videoURL = key
                    break
                }
            }
        }
        
        if let casts = movie.credits?.cast {
            for cast in casts {
                if let path = cast.profile_path {
                    detailsData.castImages.append(Constants.IMAGE_BASE + path)
                }
            }
        }
        
        return detailsData
    }
}
