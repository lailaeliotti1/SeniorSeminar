//
//  ImagePicker.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 9/10/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showImagePicker = false
    @State private var profileImage: UIImage? = nil
    @EnvironmentObject var postViewModel: PostViewModel

    var body: some View {
        VStack {
            // Display the selected profile image or a placeholder
            if let image = profileImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 7)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray)
            }

            // Button to show the camera for changing the profile picture
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

            // List of posts
            List(postViewModel.posts) { post in
                VStack(alignment: .leading) {
                    Image(uiImage: post.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                    Text(post.description)
                        .font(.body)
                        .padding(.top, 5)
                }
                .padding(.vertical)
            }
        }
        // Present the ImagePicker with the camera as the source
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $profileImage)  // Fixed reference to .camera
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(PostViewModel())
    }
}
