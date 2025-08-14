//
//  TableViewParallaxCell.swift
//  Example
//
//  Created by William.Weng on 2025/8/14.
//

import UIKit
import WWTableViewParallaxCell

class TableViewParallaxCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
}

// MARK: - WWTableViewParallaxCell
extension TableViewParallaxCell: WWTableViewParallaxCell {
    
    func parallaxImageView() -> UIImageView { return myImageView }
}


