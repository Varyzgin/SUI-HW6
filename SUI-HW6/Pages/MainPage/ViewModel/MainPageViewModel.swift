//
//  MainPageViewModel.swift
//  SUI-HW6
//
//  Created by Dim on 02.07.2025.
//

import Foundation
internal import Combine

class MainPageViewModel: ObservableObject {
    @Published var content: MainPageModel = .init(title: "Новости", news: [])

    let service = NetworkService(urlString: "https://api.unsplash.com")
    
    func fetchData() {
        service.sendRequest(for: .list, params: ["Content-Type": "application/json"], headers: ["Authorization": "Client-ID 6PgiFLKinDxM6Ebz502_NRQ-X_Ay_txIRoF1mYysqb0"], responseType: [PhotoShortInfo].self) { response in
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
                self.content.news = news
            }
        }
    }
}
