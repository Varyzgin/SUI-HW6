//
//  AppEnviroment.swift
//  SUI-HW6
//
//  Created by Dim on 06.07.2025.
//


import SwiftUI
internal import Combine

class AppEnvironment: ObservableObject {
    @Published var launching: Bool = true

    func launched() {
        launching.toggle()
    }
}
