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
        service.sendRequest(for: .fullInfo(transferedData.id), responseType: PhotoFullInfo.self) { info in
            var tags: [String] = []
            
            info.tags.forEach { tags.append($0.title) }
            
            DispatchQueue.main.async { self.content.tagsForSearching = tags }
        }
        
        if let tags = content.tagsForSearching {
            tags.forEach { print($0) }
//            service.sendRequest(for: .related(tags), responseType: , completion: <#T##(Decodable) -> Void#>)
        }
    }
}
