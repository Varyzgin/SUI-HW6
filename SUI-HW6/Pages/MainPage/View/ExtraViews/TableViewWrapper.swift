//
//  TableView.swift
//  SUI-HW6
//
//  Created by Dim on 24.06.2025.
//

import SwiftUI
import UIKit

struct TableViewWrapper: UIViewRepresentable {
    @Binding var path: [Page]
    @Binding var news: [News]
    
    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.update(news: news)
    }
    
    func makeUIView(context: Context) -> UIView {        
        let tableView = UITableView()
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: NewsViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        context.coordinator.tableView = tableView
        return tableView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(path: $path, news: news) { news in
            print(news)
            path.append(.related(news))
        }
    }

    static func calculateFrame(for data: News, screenWidth: CGFloat) -> CGSize {
        let contentWidth = screenWidth - 2 * Margins.M - Margins.XS - 32
        var height = Margins.S

        height += CGSize.minSizeForTextInView(for: data.title, with: UIFont.preferredFont(forTextStyle: .body), maxWidth: contentWidth, maxLines: 2).height
        height += Margins.XS

        height += 17 + Margins.S // recentness + padding
        return CGSize(width: contentWidth, height: height)
    }

    final class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        @Binding var path: [Page]
        var news: [News]
        weak var tableView: UITableView?
        
        var completion: (News) -> Void
        
        init(path: Binding<[Page]>, news: [News], completion: @escaping (News) -> Void) {
            self._path = path
            self.news = news
            self.completion = completion
        }
        
        func update(news: [News]) {
            self.news = news
            self.tableView?.reloadData()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            news.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let calculatedFrame = calculateFrame(for: news[indexPath.row], screenWidth: tableView.frame.width)
            return calculatedFrame.height < 80 + 2 * Margins.S ? 80 + 2 * Margins.S : calculatedFrame.height
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            completion(news[indexPath.row])
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier, for: indexPath) as? NewsViewCell
            else { return UITableViewCell() }
            cell.configure(with: news[indexPath.row])
            return cell
        }
    }
}
