//
//  ScheduledPostsViewModel.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 14/11/25.
//

import Foundation
import SwiftUI
internal import Combine

class ScheduledPostsViewModel: ObservableObject {
    @Published var posts: [ScheduledPost] = []
    
    private let saveKey = "scheduled_posts"
    
    init() {
        loadPosts()
    }
    
    func addPost(date: Date, image: UIImage) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let newPost = ScheduledPost(date: date, imageData: data)
            posts.append(newPost)
            savePosts()
        }
    }
    
    func savePosts() {
        if let encoded = try? JSONEncoder().encode(posts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func loadPosts() {
        if let saved = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([ScheduledPost].self, from: saved) {
            posts = decoded
        }
    }
}

