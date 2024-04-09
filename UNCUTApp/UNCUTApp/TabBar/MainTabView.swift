//
//  MainTabView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 4/9/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Feed")
                .tabItem { Image(systemName: "house") }
            Text("Upload Post")
                .tabItem { Image(systemName: "camera") }
            Text("Notifications")
                .tabItem { Image(systemName: "bell") }
            Text("Profile")
                .tabItem { Image(systemName: "person") }
        }
        .accentColor(.black)
        
    }
}

#Preview {
    MainTabView()
}
