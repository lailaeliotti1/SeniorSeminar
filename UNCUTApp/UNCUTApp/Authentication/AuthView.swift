//
//  AuthView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/4/24.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack{
            NavigationLink{
                Text("Hello World")
            } label: {
                Text("Sign in with email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack{
        AuthView()
    }
}
