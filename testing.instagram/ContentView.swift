//
//  ContentView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//
import SwiftUI

struct ContentView: View {
    @State private var showNotifications = false
    @State private var showMessages = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                // Barra Superiore fissa
                TapBarView(showNotifications: $showNotifications, showMessages: $showMessages)
                
                // Qui sotto la tua TabView
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                    
                    AddPostView()
                        .tabItem {
                            Image(systemName: "plus.app")
                        }
                    
                    ReelsView()
                        .tabItem {
                            Image(systemName: "play.square")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.circle")
                        }
                }
            }
            .navigationDestination(isPresented: $showNotifications) {
                NotificationsView()
            }
            .navigationDestination(isPresented: $showMessages) {
                MessagesView()
            }
        }
    }
}

#Preview {
    ContentView()
}
