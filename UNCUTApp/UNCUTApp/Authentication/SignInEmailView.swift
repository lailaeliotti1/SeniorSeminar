//
//  SignInEmailView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/5/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
}
struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    NavigationStack{
        SignInEmailView()
    }
}
