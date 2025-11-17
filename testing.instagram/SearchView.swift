//
//  SearchView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//


import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // 🔍 Barra di ricerca
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 12)
                .padding(.top, 8)

                Spacer()

                // 👇 Placeholder o risultati
                Text(searchText.isEmpty ? "Search for users..." : "Searching for: \(searchText)")
                    .foregroundColor(.gray)
                    .padding()

                Spacer()
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}

#Preview {
    SearchView()
}
