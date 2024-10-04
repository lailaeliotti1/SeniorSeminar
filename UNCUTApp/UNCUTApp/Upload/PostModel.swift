import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let image: UIImage
    let description: String
}

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
}