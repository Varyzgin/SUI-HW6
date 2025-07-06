//
//  GalleryViewCell.swift
//  SUI-HW6
//
//  Created by Dim on 03.07.2025.
//

import UIKit

final class GalleryViewCell: UICollectionViewCell {
    static let id: String = "GalleryViewCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 500))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    
    
    func configure(with regularImageURL: String) {
        imageView.load(url: URL(string: regularImageURL)!)
    }
    
}
