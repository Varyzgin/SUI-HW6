//
//  RelatedPageViewController.swift
//  SUI-HW6
//
//  Created by Dim on 02.07.2025.
//

import SwiftUI
import UIKit

struct RelatedPageView: UIViewControllerRepresentable {
    let news: News
    @StateObject var viewModel: RelatedPageViewModel
    
    init(news: News) {
        self.news = news
        _viewModel = StateObject(wrappedValue: RelatedPageViewModel(transferedData: news))
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        RelatedPageViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
}

final class RelatedPageViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .systemBackground
        collectionView.register(GalleryViewCell.self, forCellWithReuseIdentifier: GalleryViewCell.id)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
