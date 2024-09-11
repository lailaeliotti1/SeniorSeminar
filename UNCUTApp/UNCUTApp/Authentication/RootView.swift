import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            // Show MainTabView if user is authenticated, otherwise show AuthView
            if showSignInView {
                NavigationStack {
                    AuthView(showSignInView: $showSignInView)
                }
            } else {
                MainTabView() // Show the MainTabView after successful login
            }
        }
        .onAppear {
            // Check if the user is authenticated when the view appears
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    RootView()
}
