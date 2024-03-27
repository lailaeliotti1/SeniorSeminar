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
        }
        .navigationBarTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
}
