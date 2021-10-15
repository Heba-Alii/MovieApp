//
//  MovieCell.swift
//  MovieApp
//
//  Created by Heba on 13/10/2021.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    @IBOutlet weak var MovieImage: UIImageView!
    
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieSubTitle: UILabel!
    @IBOutlet weak var MovieRate: UILabel!
    
    @IBOutlet weak var MovieType: UILabel!
    @IBOutlet weak var MovieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movieData: MovieData)
    {
        MovieImage.sd_setImage(with: URL(string: movieData.imgURL), completed: nil)
        MovieTitle.text = movieData.title
        MovieSubTitle.text = movieData.subTitle
        
        MovieRate.text = String(describing: movieData.rate)
        
        MovieType.text = ""
        
        if(movieData.genre != nil){
            MovieType.text = String(describing: movieData.genre!) + " | "
        }
        
        if(movieData.runtime != nil){
            MovieType.text! += String(describing: movieData.runtime!) + " | "
        }
        
        MovieType.text! += movieData.date
            
        if let description =  movieData.description {
            MovieDescription.text = description
        }
    }
}
