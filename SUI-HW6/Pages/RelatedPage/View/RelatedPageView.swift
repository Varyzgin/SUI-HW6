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
        RelatedPageViewController(news: viewModel.content.relatedNewsData)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let controller = uiViewController as? RelatedPageViewController {
            controller.updateData(viewModel.content.relatedNewsData)
        }
    }
    
}

final class RelatedPageViewController: UIViewController {
    var news: [News]
    init(news: [News]) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    func updateData(_ news: [News]) {
        self.news = news
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
//        collectionView.backgroundColor = .systemBackground
        collectionView.register(GalleryViewCell.self, forCellWithReuseIdentifier: GalleryViewCell.id)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension RelatedPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryViewCell.id, for: indexPath) as? GalleryViewCell
        else { return UICollectionViewCell() }
        cell.configure(with: news[indexPath.item].regularImageStringUrl)
        return cell
    }
}
