//
//  AddPostView.swift
//  testing.instagram
//
//  Created by Sabrina Bonetti on 07/11/25.
//

import SwiftUI
import PhotosUI

struct AddPostView: View {
    @State private var selectedDate: Date = Date()
    @State private var selectedImage: UIImage? = nil
    @State private var showPicker = false
    @State private var showConfirmation = false
    @State private var confirmationMessage = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {

                    Text("Plan Your Post")
                        .font(.title2)
                        .bold()
                        .padding(.top)

                    // 📅 CALENDARIO
                    DatePicker(
                        "Select a day",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()

                    // 📅 Mostra data scelta
                    Text("Selected day: \(formattedDate(selectedDate))")
                        .font(.headline)

                    // 🖼️ FOTO SELEZIONATA
                    if let img = selectedImage {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                            .cornerRadius(12)
                            .padding(.vertical)
                    } else {
                        Text("No image selected")
                            .foregroundColor(.gray)
                    }

                    // 📸 BOTTONE PER SELEZIONARE FOTO
                    PhotosPicker(selection: Binding(
                        get: { nil },
                        set: { newItem in loadImage(from: newItem) }
                    ), matching: .images) {
                        Text("Choose Photo")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)

                    // ✔️ BOTTONE PER PROGRAMMARE
                    Button {
                        if let _ = selectedImage {
                            confirmationMessage = "Post scheduled for \(formattedDate(selectedDate))"
                            showConfirmation = true
                            selectedImage = nil
                        }
                    } label: {
                        Text("Schedule Post")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedImage == nil ? Color.gray : Color.blue)
                            .cornerRadius(12)
                    }
                    .disabled(selectedImage == nil)
                    .padding(.horizontal)

                    Spacer()
                }
            }
            .navigationTitle("Add Post")
            .alert("Post Scheduled!", isPresented: $showConfirmation) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(confirmationMessage)
            }
        }
    }

    // FORMATTA DATA
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }

    // CARICA FOTO DALLA GALLERIA
    func loadImage(from item: PhotosPickerItem?) {
        Task {
            if let data = try? await item?.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                selectedImage = uiImage
            }
        }
    }
}

#Preview {
    AddPostView()
}
