//
//  AuthView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/4/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class AuthViewModel: ObservableObject {
    
    func signInGoogle() async throws{
        let helper = GoogleSignInHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        
    }
}

struct AuthView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: SignInEmailView(showSignInView: $showSignInView)) {
                    Text("Sign in with email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal), action: {
                    Task{
                        do {
                            try await viewModel.signInGoogle()
                            showSignInView = false
                        }
                        catch {
                            print(error)
                        }
                        }
                })
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(showSignInView: .constant(false))
    }
}
