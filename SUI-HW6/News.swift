//
//  NewsDownloader.swift
//  SUI-HW6
//
//  Created by Dim on 24.06.2025.
//

struct News: Hashable {
    var id: String
    var title: String
    var thumbImageStringUrl: String
    var regularImageStringUrl: String
    var recentness: String
}

extension News {
//    func load() -> [News] {
//        let service = NetworkService(urlString: "https://api.unsplash.com")
//        service.sendRequest(for: .list, params: ["Content-Type": "application/json"], headers: ["Authorization": "Client-ID 6PgiFLKinDxM6Ebz502_NRQ-X_Ay_txIRoF1mYysqb0"], responseType: [PhotoShortInfo].self) { response in
//            var news: [News] = []
//            response.forEach { news.append(News(id: $0.id, title: $0.description ?? "!non!", imageString: $0.urls.thumb, recentness: "!non!")) }
//        }
//    }
//    
    static func mock() -> [News] {
        [
//            News(id: "gj", title: "Lorem incan rlvrleh jehrbnlaer harbvkhareb aehrvblaerhv", imageString: "", recentness: "2 часа назад"),
//            News(id: "gj2", title: "Lorem incan 2", imageString: "", recentness: "3 часа назад"),
        ]
    }
}
