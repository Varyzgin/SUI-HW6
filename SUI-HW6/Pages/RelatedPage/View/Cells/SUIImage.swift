//
//  SUIImage.swift
//  SUI-HW6
//
//  Created by Dim on 07.07.2025.
//

import SwiftUI

struct SUIImage: View {
    var urlString: String
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(Margins.S)

        } placeholder: {
            ProgressView()
        }
    }
}
