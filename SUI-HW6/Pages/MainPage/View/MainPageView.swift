//
//  ContentView.swift
//  SUI-HW6
//
//  Created by Dim on 24.06.2025.
//

import SwiftUI

struct MainPageView: View {
    @Binding var path: [Page]
    @EnvironmentObject var appEnvironment: AppEnvironment
    @StateObject var viewModel: MainPageViewModel = .init()
    
    var body: some View {
        TableViewWrapper(path: $path, news: $viewModel.content.news)
            .onAppear {
                if appEnvironment.launching {
                    viewModel.fetchData()
                    appEnvironment.launching.toggle()
                }
        }
    }
}

//#Preview {
//    MainPageView()
//}
