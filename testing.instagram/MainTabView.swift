//
//  MainTabView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            AddPostView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("New Post")
                }

            ReelsView()
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Reels")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
