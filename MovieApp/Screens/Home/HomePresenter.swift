//
//  HomePresenter.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import Foundation

class HomePresenter{
    
    var moviesData: [MovieData] = [MovieData]() // 20
    var moviesFullDetails: [Movie] = [Movie]()  // 20
    
    private weak var homeVC: HomeVC?
    
    init(home : HomeVC){
        homeVC = home
    }
    
    func searchMovie(search : String?){
        guard let search = search else { return }
        
        homeVC?.showIndicator()
        let url: String = URLBuilder(withBaseURL: Constants.BASE_URL , Constants.SEARCH_MOVIES)
            .addQueryItem(key: Constants.API_Parms_KEYS.api_key, value: Constants.APIKEY)
            .addQueryItem(key: Constants.API_Parms_KEYS.query, value: search)
            .addQueryItem(key: Constants.API_Parms_KEYS.page, value: 1)
            .build().absoluteString
        
        BaseAPI.fetchData(url: url, responseClass: SearchResult.self) { [weak self] (response) in
            guard let self = self else { return }
            switch(response){
                
            case .success(let data):
                guard let data = data else { return }
                
                guard let movies = data.movies else { return }
                
                for movie in movies {
                    let formattedMovie = self.formatMovie(movie: movie)
                    self.moviesData.append(formattedMovie)
                }
                
                for movieData in self.moviesData {
                    self.getMovieFullDetails(id: movieData.id, movieData: movieData)
                }
                
            case .failure(let error):
                self.homeVC?.onFailure(error)
            }
        }
    }
    
    func getMovieFullDetails(id: Int, movieData: MovieData){
        let url: String = URLBuilder(withBaseURL: Constants.BASE_URL, Constants.DETAILS_MOVIE + String(describing: id)).addQueryItem(key: Constants.API_Parms_KEYS.api_key, value: Constants.APIKEY).build().absoluteString
        
        BaseAPI.fetchData(url: url, responseClass: Movie.self) { result in
            switch(result){
            case.success(let movie):
                guard let movie = movie else { return }
                
                if let runtime = movie.runtime {
                    movieData.runtime = String(describing: runtime)
                }
                
                if let generes = movie.genres, !generes.isEmpty {
                    movieData.genre = generes[0].name
                }
                
                self.moviesFullDetails.append(movie)
                
                if(self.moviesData.count == self.moviesFullDetails.count) {
                    self.homeVC?.onSuccess()
                    self.homeVC?.hideIndicator()
                }
                
            case.failure(let error):
                self.homeVC?.onFailure(error)
                self.homeVC?.hideIndicator()
            }
        }
    }
    
    private func formatMovie(movie: Movie) -> MovieData{
        var imgURL: String!
        var title: String = ""
        var subTitle: String = ""
        var rate: String = "N/A"
        var releaseDate: String = "N/A"
        
        if let posterpath = movie.poster_path {
            imgURL = Constants.IMAGE_BASE + posterpath
        } else {
            imgURL = "https://via.placeholder.com/150"
        }
        
        let title_subtitle : [String] = movie.title.components(separatedBy: ":")
        
        title = title_subtitle[0]
        
        if(title_subtitle.count > 1){
            title += ":"
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
        
        let movieData = MovieData(id: movie.id, imgURL: imgURL, title: title, subTitle: subTitle, rate: rate, genre: nil, runtime: nil, date: releaseDate, description: movie.overview)
        
        return movieData
    }
}
