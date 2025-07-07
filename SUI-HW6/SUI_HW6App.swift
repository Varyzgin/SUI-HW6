//
//  SUI_HW6App.swift
//  SUI-HW6
//
//  Created by Dim on 24.06.2025.
//

import SwiftUI
internal import Combine

enum Page: Hashable {
    case main, related(News)
}

@main
struct SUI_HW6App: App {
    @State var path: [Page] = []
    @StateObject var appEnvironment: AppEnvironment = .init()
    
    var body: some Scene {
        WindowGroup {
//            RelatedPageView(news: 
//                News(id: "gknjrng", title: "fkjsn", thumbImageStringUrl: "jrngek", regularImageStringUrl: "rgjek", recentness: "krgnekw")
//            )
            NavigationStack(path: $path) {
                MainPageView(path: $path)
                    .environmentObject(appEnvironment)
                    .navigationDestination(for: Page.self) { page in
                        switch page {
                        case .main:
                            MainPageView(path: $path)
                                .environmentObject(appEnvironment)
                        case .related(let news):
                            RelatedPageView(news: news)
                        }
                    }
            }
        }
    }
}
