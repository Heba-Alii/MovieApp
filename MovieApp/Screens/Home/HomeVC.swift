//
//  HomeVC.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import UIKit

class HomeVC: UIViewController, NetworkProtocol {
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableDetails: UITableView!
    
    var presenter : HomePresenter?
    var searchedMovies: [MovieData] = [MovieData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        search.delegate = self
        presenter = HomePresenter(home: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func onSuccess(){
        self.searchedMovies = presenter!.moviesData
        self.tableDetails.reloadData()
    }
    
    func onFailure(_ error : Error){
        print(error.localizedDescription)
    }
    
    func showIndicator(){
        print("Show Indicator")
    }
    
    func hideIndicator(){
        print("Hide Indicator")
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTable(){
        self.tableDetails.delegate = self
        self.tableDetails.dataSource = self
        self.tableDetails.register(UINib(nibName: Constants.Cells.movieCell, bundle: nil), forCellReuseIdentifier: Constants.Cells.movieCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.movieCell, for: indexPath) as! MovieCell
        
        cell.configureCell(movieData: searchedMovies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsVC
        detailsVC.movieFullDetails = presenter?.moviesFullDetails[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomeVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchMovie(search: searchBar.text)

        searchBar.endEditing(true)
    }
}
