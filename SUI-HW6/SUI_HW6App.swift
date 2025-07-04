//
//  SUI_HW6App.swift
//  SUI-HW6
//
//  Created by Dim on 24.06.2025.
//

import SwiftUI

enum Page: Hashable {
    case main, related(News)
}

@main
struct SUI_HW6App: App {
    @State var path: [Page] = [.main]
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainPageView(path: $path)
                    .navigationDestination(for: Page.self) { page in
                        switch page {
                        case .main:
                            MainPageView(path: $path)
                        case .related(let news):
                            RelatedPageView(news: news)
                        }
                    }
            }
        }
    }
}
