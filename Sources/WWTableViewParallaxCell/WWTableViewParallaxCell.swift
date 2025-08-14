//
//  WWTableViewParallaxCell.swift
//  WWTableViewParallaxCell
//
//  Created by William.Weng on 2025/8/14.
//

import UIKit

// MARK: - 滾動視差的UITableViewCell
public protocol WWTableViewParallaxCell: UITableViewCell {
    
    /// 取得要實現視差的UIImageView
    func parallaxImageView() -> UIImageView
}
