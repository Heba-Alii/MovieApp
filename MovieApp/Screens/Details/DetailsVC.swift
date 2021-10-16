//
//  DetailsVC.swift
//  MovieApp
//
//  Created by Heba on 15/10/2021.
//

import UIKit
import YouTubePlayer

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var backGroundPartOne: UIImageView!
    @IBOutlet weak var backGroundPartTwo: UIImageView!
    
    @IBOutlet weak var rateEvaluation: UILabel!
    
    @IBOutlet weak var directorName: UILabel!
    @IBOutlet weak var directorJobs: UILabel!
    
    @IBOutlet weak var storyName: UILabel!
    @IBOutlet weak var storyJobs: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRelease: UILabel!

    @IBOutlet weak var youtubeViewer: YouTubePlayerView!
    
    @IBOutlet weak var overViewDesciption: UILabel!
    
    @IBOutlet weak var castImages: UICollectionView!
    
    var movieFullDetails: Movie!
    private var detailsData: DetailsData!
    private var presenter: DetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter = DetailsPresenter()
        
        detailsData = presenter.formatMovie(movie: movieFullDetails)
        showData(details: detailsData)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        imgDetails.isUserInteractionEnabled = true
        imgDetails.addGestureRecognizer(singleTap)
    }
    
    private func showData(details: DetailsData){
        imgDetails.sd_setImage(with: URL(string: details.imgURL), completed: nil)
        backGroundPartOne.sd_setImage(with: URL(string: details.imgURL), completed: nil)
        backGroundPartTwo.sd_setImage(with: URL(string: details.imgURL), completed: nil)
        addBlur()
        rateEvaluation.text = details.rate
        directorName.text=details.directorName
        directorJobs.text=details.directorJobs
        storyName.text=details.storyName
        storyJobs.text=details.storyJobs
        movieDescription.text=details.movieDescription
        movieTitle.text=details.title
        movieRelease.text=details.movieYear
        overViewDesciption.text=details.videoOverView
        
        youtubeViewer.loadVideoID(details.videoURL)
    }
    
    private func addBlur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backGroundPartTwo.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backGroundPartTwo.addSubview(blurEffectView)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapDetected() {
        let fullimageView = self.storyboard?.instantiateViewController(withIdentifier: "FullImageVC") as! FullImageVC
        fullimageView.img = detailsData.imgURL
        self.navigationController?.pushViewController(fullimageView, animated: true)
    }
}

extension DetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func configure(){
        self.castImages.delegate = self
        self.castImages.dataSource = self
        self.castImages.register(UINib(nibName: Constants.Cells.castCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cells.castCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailsData.castImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cells.castCell, for: indexPath) as! CastCell
        cell.configure(imgUrl: detailsData.castImages[indexPath.row])
        return cell
    }
    
    
}
