//
//  ProfileView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 9/10/24.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @State private var showImagePicker = false
    @State private var profileImage: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = profileImage {
                // Display the selected profile image
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 7)
            } else {
                // Placeholder image if no profile picture is selected
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray)
            }
            
            Button(action: {
                showImagePicker = true
            }) {
                Text("Change Profile Picture")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $profileImage)
        }
    }
}
