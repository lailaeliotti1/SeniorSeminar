//
//  GoogleSignInHelper.swift
//  unCUTAPP
//
//  Created by Laila Eliotti on 4/1/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSIgnINResultModel {
    let idToken: String
    let accessToken: String
}

final class GoogleSignInHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSIgnINResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else{
            throw URLError(.badServerResponse)
        }
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        let tokens = GoogleSIgnINResultModel(idToken: idToken, accessToken: accessToken)
        return tokens
    }
}
