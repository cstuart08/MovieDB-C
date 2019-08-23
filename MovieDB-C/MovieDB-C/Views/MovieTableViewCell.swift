//
//  MovieTableViewCell.swift
//  MovieDB-C
//
//  Created by Apps on 8/23/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    
    var movie: CMSMovie? {
        didSet {
            guard let movie = movie else { return }
            
            movieTitleLabel.text = movie.title
            movieRatingLabel.text = "Rating: \(movie.rating)"
            movieSummaryLabel.text = movie.summary
            }
        }
    }
