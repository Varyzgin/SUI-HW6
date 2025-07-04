//
//  NewsViewCell.swift
//  SUI-HW6
//
//  Created by Dim on 30.06.2025.
//

import UIKit

final class NewsViewCell: UITableViewCell {
    static let identifier: String = "NewsViewCell"
    lazy var baseLayout : UIView = {
        return $0
    }(UIView(frame: CGRect(
        x: Margins.S,
        y: Margins.S,
        width: contentView.frame.width - 2 * Margins.S,
        height: contentView.frame.height - 2 * Margins.S
    )))
    
    lazy var newsImageView: UIImageView = {
        $0.image = UIImage(systemName: "house")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.tintColor = .black
        return $0
    }(UIImageView(frame: CGRect(
        x: 0, y: baseLayout.bounds.midY - 40, width: 80, height: 80
    )))
    
    lazy var titleLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        return $0
    }(UILabel(frame: CGRect(
        x: newsImageView.frame.maxX + Margins.S,
        y: 0,
        width: baseLayout.frame.width - newsImageView.frame.width - Margins.S,
        height: baseLayout.frame.height - recentnessLabel.frame.height - Margins.XS
    )))
    
    lazy var recentnessLabel: UILabel = {
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .secondaryLabel
        print(contentView.frame.maxY)
        return $0
    }(UILabel(frame: CGRect(
        x: newsImageView.frame.maxX + Margins.S,
        y: baseLayout.bounds.maxY - 15,
        width: baseLayout.frame.width - newsImageView.frame.width - Margins.S,
        height: 15
    )))
    
    func configure(with data: News) {
        titleLabel.text = data.title
        recentnessLabel.text = data.recentness
        newsImageView.load(url: URL(string: data.thumbImageStringUrl)!)
        
        baseLayout.addSubview(newsImageView)
        baseLayout.addSubview(titleLabel)
        baseLayout.addSubview(recentnessLabel)
        
        contentView.addSubview(baseLayout)
    }
}
