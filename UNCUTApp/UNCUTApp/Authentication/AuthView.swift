//
//  AuthView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/4/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSIgnINResultModel {
    let idToken: String
    let accessToken: String
}

@MainActor
final class AuthViewModel: ObservableObject {
    
    func signInGoogle() async throws{
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else{
            throw URLError(.badServerResponse)
        }
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        let tokens = GoogleSIgnINResultModel(idToken: idToken, accessToken: accessToken)
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
                
                    
//                NavigationLink(destination: Text("Sign in with Google")) {
//                    Text("Sign in with Google")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.red) // You can change the color
//                        .cornerRadius(10)
//                }
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
