//
//  HomePresenter.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation

class HomePresenter{
    
    private var moviesData: [MovieData] = [MovieData]()
    private var homeVC: HomeVC?
    
    init(home : HomeVC){
        homeVC = home
    }
    
    func searchMovie(search : String){
        
        let url = URLBuilder(withBaseURL: Constants.BASE_URL , Constants.SEARCH_MOVIES)
            .addQueryItem(key: Constants.API_Parms_KEYS.api_key, value: Constants.APIKEY)
            .addQueryItem(key: Constants.API_Parms_KEYS.query, value: search)
            .addQueryItem(key: Constants.API_Parms_KEYS.page, value: 1)
            .build()
        
        BaseAPI.fetchData(url: String(describing: url.absoluteURL), responseClass: SearchResult.self) { [weak self] (response) in
            guard let self = self else { return }
            switch(response){
                
            case .success(let data):
                guard let data = data else { return }
                
                guard let movies = data.movies else { return }
                
                for movie in movies {
                    let formattedMovie = self.formatMovie(movie: movie)
                    self.moviesData.append(formattedMovie)
                }
                
                self.homeVC?.searchedMovies = self.moviesData
                self.homeVC?.tableDetails.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func formatMovie(movie: Movie) -> MovieData{
        var imgURL: String?
        var title: String = ""
        var subTitle: String = ""
        var rate: String = "N/A"
        var releaseDate: String = "N/A"
        
        if let posterpath = movie.poster_path {
            imgURL = Constants.IMAGE_BASE + posterpath
        }
        
        let title_subtitle : [String] = movie.title.components(separatedBy: ":")
        
        title = title_subtitle[0]
        
        if(title_subtitle.count > 1){
            title += ": "
            subTitle = title_subtitle[1]
        }
        
        if let movieRate = movie.vote_average {
            rate = String(describing: movieRate).replacingOccurrences(of: ".", with: ",")
        }
        
        if let date = movie.release_date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: date){
                dateFormatter.dateFormat = "dd/MM/yyyy"
                releaseDate = dateFormatter.string(from: date)
            } 
        }
        
        let movieData = MovieData(imgURL: imgURL, title: title, subTitle: subTitle, rate: rate, genre: nil, runtime: nil, date: releaseDate, description: movie.overview)
        
        return movieData
    }
}
