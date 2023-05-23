//
//  SearchDetailController.swift
//  NewYorkTimesApp
//
//  Created by Araz Muradov on 22.05.23.
//

import UIKit

class SearchDetailController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var searchDetailTable: UITableView!
    private let cellId = "CustomCell"
    var search : SearchResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
        navigationBarDesing()
        loadImage()
    }
    func loadImage() {
        image.loadImage(from: search?.imageUrl ?? "")
    }
    func configreUI() {
        searchDetailTable.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        image.layer.cornerRadius = 12
    }
    func navigationBarDesing() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
}
extension SearchDetailController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        //cell.label.text = search?.labeltext
        cell.titleLabel.text = search?.labeltext
        cell.timeLabel.text = search?.timetext
        cell.label.numberOfLines = 0
        cell.timeLabel.numberOfLines = 0
        cell.titleLabel.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

