//
//  GalleryViewCell.swift
//  SUI-HW6
//
//  Created by Dim on 03.07.2025.
//

import UIKit
import SwiftUI

final class GalleryViewCell: UICollectionViewCell {
    static let id: String = "GalleryViewCell"
    
//    lazy var imageView: UIImageView = {
//        $0.contentMode = .scaleAspectFill
//        $0.clipsToBounds = true
//        $0.image = UIImage(systemName: "photo")
//        $0.layer.cornerRadius = 20
//        return $0
//    }(UIImageView(frame: CGRect(
//        origin: CGPoint(x: Margins.S, y: Margins.S),
//        size: CGSize(width: contentView.frame.width - 2 * Margins.S, height: contentView.frame.height - 2 * Margins.S)
//    )))
    
    func configure(with regularImageURL: String) {
//        imageView.load(url: URL(string: regularImageURL)!)
//        contentView.addSubview(imageView)
        
        let imageSUI = SUIImage(urlString: regularImageURL)
        let content = UIHostingController(rootView: imageSUI)
        content.view.frame = contentView.frame
        contentView.addSubview(content.view)
//        content.didMove(toParent: self)
        
    }
    
}
