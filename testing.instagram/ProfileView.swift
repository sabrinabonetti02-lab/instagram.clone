//
//  ProfileView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedTab = 0
    @State private var posts: [Post] = [
        Post(imageName: "photo1"),
        Post(imageName: "photo2"),
        Post(imageName: "photo3"),
        Post(imageName: "photo4"),
        Post(imageName: "photo5"),
        Post(imageName: "photo6"),
        Post(imageName: "photo7"),
        Post(imageName: "photo8"),
        Post(imageName: "photo9"),
        Post(imageName: "photo10"),
        Post(imageName: "photo11"),
        Post(imageName: "photo12"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // MARK: - Header (foto profilo + statistiche)
                    HStack(alignment: .center) {
                        ZStack {
                            // Cerchio colorato stile Storia
                            Circle()
                                .stroke(LinearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3)
                                .frame(width: 98, height: 98)
                            
                            // Foto profilo
                            if UIImage(named: "profilepic") != nil {
                                Image("profilepic")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                            } else {
                                // Se non c’è ancora la foto
                                Circle()
                                    .fill(Color.gray.opacity(0.15))
                                    .frame(width: 90, height: 90)
                                Image(systemName: "person")
                                    .font(.system(size: 30))
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                        
                        HStack(spacing: 20) {
                            StatView(number: "", label: "Posts")
                            StatView(number: "", label: "Followers")
                            StatView(number: "", label: "Following")
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Info profilo
                    VStack(alignment: .leading, spacing: 6) {
                        Text("sabrina bonetti")
                            .font(.headline)
                        
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - Sezione storie
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            StoryCircle(imageName: "mylife", title: "My Life")
                            StoryCircle(imageName: "summer", title: "Summer")
                            StoryCircle(imageName: "friends", title: "Friends")
                            StoryCircle(imageName: "trips", title: "Trips")
                            StoryCircle(imageName: "story5", title: "Highlights")
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Pulsanti Edit e Share
                    HStack {
                        Button("Edit Profile") {}
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(6)
                        
                        Button("Share Profile") {}
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(6)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Tabs (Post / Reel / Tag / Repost)
                    HStack(spacing: 40) {
                        TabButton(systemImage: "square.grid.3x3", index: 0, selectedTab: $selectedTab)
                        TabButton(systemImage: "play.rectangle", index: 1, selectedTab: $selectedTab)
                        TabButton(systemImage: "person.crop.square", index: 2, selectedTab: $selectedTab)
                        TabButton(systemImage: "arrow.2.squarepath", index: 3, selectedTab: $selectedTab)
                    }
                    .padding(.top, 8)
                    .foregroundColor(.primary)
                    
                    Divider()
                    
                    // MARK: - Contenuti tab
                    if selectedTab == 0 {
                        // Griglia dei post con segnaposto
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 1), count: 3), spacing: 1) {
                            ForEach(posts) { post in
                                NavigationLink(destination: PostDetailView(post: post)) {
                                    ZStack {
                                        if UIImage(named: post.imageName) != nil {
                                            Image(post.imageName)
                                                .resizable()
                                                .scaledToFill()
                                        } else {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.15))
                                            Image(systemName: "photo")
                                                .font(.system(size: 24))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width/3 - 1,
                                           height: UIScreen.main.bounds.width/3 - 1)
                                    .clipped()
                                }
                            }
                        }
                    } else {
                        // Altri tab con testo placeholder
                        VStack(spacing: 40) {
                            Image(systemName: "photo.on.rectangle.angled")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)
                            Text("No content yet")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, minHeight: 400)
                    }
                }
                .padding(.bottom, 70)
            }
            // MARK: - Barra superiore (username + icone)
            .navigationTitle("sabrybonnyy")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell.badge")
                    }
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
    }
}

// MARK: - Componenti

struct StatView: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack {
            Text(number)
                .font(.headline)
            Text(label)
                .font(.caption)
        }
    }
}

struct StoryCircle: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(LinearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                    .frame(width: 70, height: 70)
                
                if UIImage(named: imageName) != nil {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 65, height: 65)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 65, height: 65)
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                }
            }
            Text(title)
                .font(.caption2)
        }
    }
}

struct TabButton: View {
    var systemImage: String
    var index: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        Button {
            selectedTab = index
        } label: {
            Image(systemName: systemImage)
                .font(.system(size: 22))
                .foregroundColor(selectedTab == index ? .primary : .gray)
        }
    }
}

struct Post: Identifiable {
    let id = UUID()
    let imageName: String
}

struct PostDetailView: View {
    let post: Post
    var body: some View {
        VStack {
            if UIImage(named: post.imageName) != nil {
                Image(post.imageName)
                    .resizable()
                    .scaledToFit()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    )
            }
        }
        .navigationTitle("Post")
    }
}
#Preview {
    ProfileView()
}
