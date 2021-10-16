//
//  CastCell.swift
//  MovieApp
//
//  Created by Heba on 15/10/2021.
//

import UIKit

class CastCell: UICollectionViewCell {
    @IBOutlet weak var castImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(imgUrl: String){
        self.castImg.layer.cornerRadius = castImg.frame.size.width / 2
        self.castImg.sd_setImage(with: URL(string: imgUrl), completed: nil)
    }
}
