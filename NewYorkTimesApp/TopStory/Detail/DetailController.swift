//
//  DetailController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 19.05.23.
//

import UIKit
class DetailController: UIViewController {
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    private let cellId = "CustomCell"
    private var isFavorite: Bool = false
    var story: TopStoryResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configreUI()
        navigationBarDesing()
        loadImage()
        loadFavoriteButtonState()
    }
    
    func loadImage() {
        image.loadImage(from: story?.imageUrl ?? "")
    }
    
    func configreUI() {
        detailTable.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        image.layer.cornerRadius = 12
    }
    
    func navigationBarDesing() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    func loadFavoriteButtonState() {
        if let item = story {
            let adapter = FileManagerAdapter()
            adapter.readDataFromFile()
            isFavorite = adapter.isItemFavorite(item)
            updateFavoriteButtonImage()
        }
    }
    
    func updateFavoriteButtonImage() {
        let favoriteImage = isFavorite ? UIImage(named: "heart")?.resizeImage(targetSize: favoriteButton.image?.size ?? CGSize.zero).withRenderingMode(.alwaysOriginal) : UIImage(named: "favoriteTab")?.resizeImage(targetSize: favoriteButton.image?.size ?? CGSize.zero).withRenderingMode(.alwaysOriginal)
        favoriteButton.image = favoriteImage
        
    }
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        if let item = story {
                let adapter = FileManagerAdapter()
                adapter.readDataFromFile()
                if !adapter.isItemFavorite(item) {
                    adapter.writeToJsonFile(item: item)
                    isFavorite = true
                } else {
                    adapter.deleteItem(at: adapter.items.firstIndex(where: { $0.title == item.title }) ?? -1)
                    isFavorite = false
                }
                updateFavoriteButtonImage()
            }
    }
    
    @IBAction func websiteButton(_ sender: Any) {
        if let urlString = story?.urltext, let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

extension DetailController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.label.text               = story?.abstracttext
        cell.titleLabel.text          = story?.title
        cell.timeLabel.text           = story?.updatedDate
        cell.label.numberOfLines      = 0
        cell.timeLabel.numberOfLines  = 0
        cell.titleLabel.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
}
