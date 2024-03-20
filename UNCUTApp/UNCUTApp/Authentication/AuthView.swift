//
//  AuthView.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 3/4/24.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: SignInEmailView()) {
                    Text("Sign in with email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: Text("Sign in with Google")) {
                    Text("Sign in with Google")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.red) // You can change the color
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
