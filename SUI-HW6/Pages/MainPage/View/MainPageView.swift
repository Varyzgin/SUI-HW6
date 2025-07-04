//
//  ContentView.swift
//  SUI-HW6
//
//  Created by Dim on 24.06.2025.
//

import SwiftUI

struct MainPageView: View {
    @Binding var path: [Page]
    @StateObject var viewModel: MainPageViewModel = .init()
    
    var body: some View {
        TableViewWrapper(path: $path, news: $viewModel.content.news)
            .onAppear {
            viewModel.fetchData()
        }
    }
}

//#Preview {
//    MainPageView()
//}
