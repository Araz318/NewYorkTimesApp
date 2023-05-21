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
    private let cellId = "CustomCell"
   
   
    
    var story: TopStoryResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
        navigationBarDesing()
        loadImage()
        
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
}
extension DetailController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.label.text = story?.abstracttext
        cell.titleLabel.text = story?.title
        cell.label.numberOfLines = 0
        cell.titleLabel.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
