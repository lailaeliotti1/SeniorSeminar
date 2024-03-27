//
//  RootView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/26/24.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false
    var body: some View {
        
        ZStack {
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear{
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack() {
                AuthView()
            }
        })
    }
}

#Preview {
    RootView()
}
