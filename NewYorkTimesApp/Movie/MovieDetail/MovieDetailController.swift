//
//  MovieDetailController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 28.05.23.
//

import UIKit

class MovieDetailController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var detailTable: UITableView!
    private let cellId = "MovieDetailCell"
    var movie: Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        configreUI()
    }
    func loadImage() {
        image.loadImage(from: movie?.imageUrl ?? "")
    }
    func configreUI() {
        detailTable.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        image.layer.cornerRadius = 12
    }
    
}
extension MovieDetailController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
        cell.titleLabel.text                = movie?.displayTitle
        cell.bylineLabel.text               = movie?.byline
        cell.dateLabel.text                 = movie?.publicationDate
        cell.ratingLabel.text               = movie?.mpaaRating
        cell.headlineLabel.text             = movie?.headline
        cell.sumaryshortLabel.text          = movie?.summaryShort
        cell.headlineLabel.numberOfLines    = 0
        cell.sumaryshortLabel.numberOfLines = 0
        cell.titleLabel.numberOfLines       = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
}

