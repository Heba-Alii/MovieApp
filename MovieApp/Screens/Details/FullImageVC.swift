//
//  FullImageVC.swift
//  MovieApp
//
//  Created by Heba on 16/10/2021.
//

import UIKit

class FullImageVC: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    var img: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(singleTap)
        self.imgView.sd_setImage(with: URL(string: img), completed: nil)
    }
    
    @objc func tapDetected() {
        self.navigationController?.popViewController(animated: true)
    }
}
