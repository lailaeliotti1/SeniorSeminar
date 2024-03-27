//
//  SignInEmailView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/5/24.
//

import SwiftUI
@MainActor
final class SignInEmailViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var isLoading = false
    
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
            
            Button(action: {
                viewModel.signIn()
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
//                        .disabled(isLoading) // Disable button when loading
//                                    .opacity(isLoading ? 0.5 : 1.0) // Reduce opacity when loading
//                                    .overlay(
//                                        ProgressView() // Show a loading indicator
//                                            .opacity(isLoading ? 1.0 : 0.0) // Show loading indicator conditionally
//                                    )
            Spacer();
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
