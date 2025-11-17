//
//  ScheduledPost.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 14/11/25.
//

import Foundation
import SwiftUI

struct ScheduledPost: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let imageData: Data
}

