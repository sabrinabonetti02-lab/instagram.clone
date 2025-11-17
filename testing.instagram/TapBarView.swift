//
//  TapBarView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//

import SwiftUI

struct TapBarView: View {
    @Binding var showNotifications: Bool
    @Binding var showMessages: Bool
    
    var body: some View {
        HStack {
            // Logo Instagram o nome
            Text("Instagram")
                .font(.title2)
                .bold()
                .padding(.leading, 10)
            
            Spacer()
            
            // Cuore
            Button(action: { showNotifications = true }) {
                Image(systemName: "heart")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .padding(.trailing, 15)
            }
            
            // Messaggi (paperplane)
            Button(action: { showMessages = true }) {
                Image(systemName: "paperplane")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .padding(.trailing, 10)
            }
        }
        
        .background(Color.white)
        .overlay(
            Divider()
                .background(Color.gray.opacity(0.2)),
            alignment: .bottom
        )
    }
}


