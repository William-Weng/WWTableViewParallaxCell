//
//  Extension.swift
//  WWTableViewParallaxCell
//
//  Created by William.Weng on 2025/8/14.
//

import UIKit

// MARK: - UITableViewCell
public extension UITableViewCell {
    
    /// [滾動視差 (看得到的Cell)](https://zh.freepik.com/照片/風景)
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - view: UIView
    static func _parallaxCells(_ tableView: UITableView, didScrollOnView view: UIView) {
        
        for cell in tableView.visibleCells {
            guard let cell = cell as? WWTableViewParallaxCell else { return }
            cell._parallaxCell(on: tableView, at: cell.parallaxImageView(), didScrollOn: view)
        }
    }
}

// MARK: - UITableViewCell
private extension UITableViewCell {
    
    /// [實現視差捲動效果 - Parallax Scrolling](https://blog.csdn.net/baby_hua/article/details/50378138)
    /// - Parameters:
    ///   - tableView: [UITableView](https://www.cnblogs.com/xiaofeixiang/p/5152828.html)
    ///   - imageView: [UIImageView](https://ios.devdon.com/archives/643)
    ///   - view: UIView
    func _parallaxCell(on tableView: UITableView, at imageView: UIImageView, didScrollOn view: UIView) {
        
        let parallaxHeight = imageView.frame.height - frame.height
        let rectInSuperview = tableView.convert(frame, to: view)
        let distanceFromCenter = view.frame.height / 2 - rectInSuperview.minY
        let percent = distanceFromCenter / view.frame.height
        let move = parallaxHeight * percent
        
        var imageRect = imageView.frame
        
        imageRect.origin.y = -(parallaxHeight * 0.5) + move
        imageView.frame = imageRect
    }
}
