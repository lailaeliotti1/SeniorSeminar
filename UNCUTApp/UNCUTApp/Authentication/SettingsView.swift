//
//  SettingsView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/26/24.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async {
        let email = "hello123@testing.com"
        try? await AuthManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async {
        let password = "hello123"
        try? await AuthManager.shared.updatePassword(password: password)
    }
}
struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool

   
    var body: some View {
        List {
            Button("Log out"){
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            Button("Reset Password"){
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET")
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            Button("Update Password"){
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD UPDATED")
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            Button("Update Email"){
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL UPDATED")
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
        }
        .navigationBarTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
}
