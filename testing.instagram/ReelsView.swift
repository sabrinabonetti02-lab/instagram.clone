//
//  ReelsView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//

import SwiftUI

struct ReelsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Reels Section")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .navigationTitle("Reels")
        }
    }
}

#Preview {
    ReelsView()
}
