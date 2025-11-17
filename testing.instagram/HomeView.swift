//
//  HomeView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//

import SwiftUI

struct HomeView: View {
    @State private var stories: [Story] = [
        Story(imageName: "yourstory", username: "Your story"),
        Story(imageName: "story1", username: ""),
        Story(imageName: "story2", username: ""),
        Story(imageName: "story3", username: ""),
        Story(imageName: "story4", username: "")
    ]
    
    @State private var posts: [PostModel] = [
        PostModel(username: "blue.love", imageName: "post1", caption: "blue roses💙💙💙.", likes: 206, comments: 1),
        PostModel(username: "badgalriri", imageName: "post2", caption: "deep sea paddle boarding in brazil", likes: 4288, comments: 120),
        PostModel(username: "travels_around_the_world", imageName: "post3", caption: "City vibes 🏙️", likes: 187, comments: 4)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    
                    // MARK: - Sezione Storie
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(stories) { story in
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(LinearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3)
                                            .frame(width: 75, height: 75)
                                        
                                        if UIImage(named: story.imageName) != nil {
                                            Image(story.imageName)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 68, height: 68)
                                                .clipShape(Circle())
                                        } else {
                                            Circle()
                                                .fill(Color.gray.opacity(0.2))
                                                .frame(width: 68, height: 68)
                                            Image(systemName: "person")
                                                .font(.system(size: 24))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    Text(story.username)
                                        .font(.caption2)
                                }
                            }
                        }
                    
                    }
                    
                    Divider()
                    
                    // MARK: - Feed dei post
                    VStack(spacing: 20) {
                        ForEach(posts) { post in
                            VStack(alignment: .leading, spacing: 8) {
                                
                                // Header del post
                                HStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 40, height: 40)
                                        .overlay(
                                            Image(systemName: "person.fill")
                                                .foregroundColor(.gray)
                                        )
                                    
                                    Text(post.username)
                                        .font(.headline)
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                }
                                .padding(.horizontal, 10)
                                
                                // Immagine principale del post
                                if UIImage(named: post.imageName) != nil {
                                    Image(post.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 400)
                                        .clipped()
                                } else {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.15))
                                        .frame(height: 400)
                                        .overlay(
                                            Image(systemName: "photo")
                                                .font(.system(size: 50))
                                                .foregroundColor(.gray)
                                        )
                                }
                                
                                // Sezione bottoni (like, comment, share)
                                HStack(spacing: 20) {
                                    Image(systemName: "heart")
                                    Image(systemName: "bubble.right")
                                    Image(systemName: "paperplane")
                                    Spacer()
                                    Image(systemName: "bookmark")
                                }
                                .font(.title3)
                                .padding(.horizontal, 12)
                                .foregroundColor(.primary)
                                
                                // Likes e descrizione
                                Text("\(post.likes) likes")
                                    .font(.subheadline)
                                    .bold()
                                    .padding(.horizontal, 12)
                                
                                Text(post.caption)
                                    .font(.subheadline)
                                    .padding(.horizontal, 12)
                                    .padding(.bottom, 6)
                                
                                Text("View all \(post.comments) comments")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 12)
                            }
                        }
                    }
                }
                .padding(.bottom, 80)
            }
            
       
      // MARK: - Barra superiore
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "heart")
                    }
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                    }
                }
            }
        }
    }
}

// MARK: - Modelli dati

struct Story: Identifiable {
    let id = UUID()
    let imageName: String
    let username: String
}

struct PostModel: Identifiable {
    let id = UUID()
    let username: String
    let imageName: String
    let caption: String
    let likes: Int
    let comments: Int
}
#Preview {
    HomeView()
}
