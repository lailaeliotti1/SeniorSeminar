//
//  PostViewModel.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 10/22/24.
//

import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = [
        Post(image: UIImage(systemName: "photo")!, description: "This is a post description.")
    ]
}

struct Post: Identifiable {
    var id = UUID()
    var image: UIImage
    var description: String
}
