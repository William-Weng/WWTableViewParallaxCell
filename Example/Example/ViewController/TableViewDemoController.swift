//
//  TableViewDemoController.swift
//  Example
//
//  Created by William.Weng on 2025/8/14.
//

import UIKit
import WWTableViewParallaxCell

// MARK: - TableViewDemoController
final class TableViewDemoController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TableViewParallaxCell._parallaxCells(myTableView, didScrollOnView: view)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TableViewDemoController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewParallaxCell", for: indexPath) as! TableViewParallaxCell
        cell.myImageView.image = UIImage(named: "Image00\(indexPath.row + 1)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 0.75
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        TableViewParallaxCell._parallaxCells(myTableView, didScrollOnView: view)
    }
}
