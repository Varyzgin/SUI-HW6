//
//  RelatedPageViewModel.swift
//  SUI-HW6
//
//  Created by Dim on 04.07.2025.
//

import SwiftUI
internal import Combine

final class RelatedPageViewModel: ObservableObject {
    @Published var content: RelatedPageModel
    
    private let service = NetworkService(urlString: "https://api.unsplash.com")
    
    init(transferedData: News) {
        self.content = RelatedPageModel(transferedNewsData: transferedData, relatedNewsData: [])
        service.sendRequest(for: .fullInfo(transferedData.id), params: ["Content-Type": "application/json"], headers: ["Authorization": "Client-ID 6PgiFLKinDxM6Ebz502_NRQ-X_Ay_txIRoF1mYysqb0"],  responseType: PhotoFullInfo.self) { info in
            var tags: [String] = []
            
            info.tags.forEach { tags.append($0.title) }
            
            DispatchQueue.main.async {
                self.content.tagsForSearching = tags
                tags.forEach { print($0) }
                if !tags.isEmpty {
                    var str = ""
                    for i in stride(from: 0, to: min(tags.count - 1, 10), by: 2) {
                        let adding = tags[i].replacingOccurrences(of: " ", with: "+")
                        str += "\(adding)+"
                    }
                    str.removeLast()
                    self.service.sendRequest(for: .related(tags), params: ["Content-Type": "application/json", "query": str], headers: ["Authorization": "Client-ID 6PgiFLKinDxM6Ebz502_NRQ-X_Ay_txIRoF1mYysqb0"],  responseType: [PhotoShortInfo].self) { response in
                        
                        var news: [News] = []
                        response.forEach {
                            var title = "!non!"
                            if let alt_description = $0.alt_description {
                                title = alt_description
                            } else if let description = $0.description {
                                title = description
                            }
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            //2025-07-02T10:02:43Z
                            var dateString = "!non!"
                            if let date = dateFormatter.date(from: $0.updated_at) {
                                dateFormatter.dateFormat = "dd MMMM HH:mm"
                                dateString = dateFormatter.string(from: date)
                            }
                            
                            news.append(News(id: $0.id, title: title, thumbImageStringUrl: $0.urls.thumb, regularImageStringUrl: $0.urls.regular, recentness: dateString))
                        }
                        
                        DispatchQueue.main.async {
                            self.content.relatedNewsData = news
                        }
                    }
                }
            }
        }
    }
}
