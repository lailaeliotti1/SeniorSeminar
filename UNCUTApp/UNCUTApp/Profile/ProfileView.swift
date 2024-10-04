import SwiftUI

struct ProfileView: View {
    @State private var showImagePicker = false
    @State private var profileImage: UIImage? = nil
    @EnvironmentObject var postViewModel: PostViewModel

    var body: some View {
        VStack {
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
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $profileImage, sourceType: .camera)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(PostViewModel())
    }
}