//
//  MovieListTableViewController.swift
//  MovieDB-C
//
//  Created by Apps on 8/23/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies = [CMSMovie]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieSearchBar.delegate = self

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.movieSearchBar.text, !searchTerm.isEmpty else { return }
        searchBar.resignFirstResponder()
        
        CMSMovieController.searchForMovie(withSearchTerm: searchTerm) { [weak self] (searchedMovies) in
            guard let self = self else { return }
            self.movies = searchedMovies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.movieSearchBar.text = ""
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.movie = movie

        return cell
    }
}
