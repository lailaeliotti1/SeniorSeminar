import SwiftUI

struct CreateImagePostView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    @State private var postDescription: String = ""
    @EnvironmentObject var postViewModel: PostViewModel

    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            } else {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            }

            TextField("Enter description", text: $postDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                submitPost()
            }) {
                Text("Submit Post")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedImage, sourceType: .camera)
        }
        .navigationTitle("Create Image Post")
    }

    private func submitPost() {
        guard let selectedImage = selectedImage else { return }
        let newPost = Post(image: selectedImage, description: postDescription)
        postViewModel.posts.append(newPost)
        print("Post submitted with description: \(postDescription)")
    }
}

struct CreateImagePostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateImagePostView()
                .environmentObject(PostViewModel())
        }
    }
}