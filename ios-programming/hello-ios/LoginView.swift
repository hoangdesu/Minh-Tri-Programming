//
//  LoginView.swift
//  hello-ios
//
//  Created by Brian on 17/01/2026.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var result = ""
    
    var body: some View {
        
        HomeView()
        
        VStack(spacing: 20) {
            Text("Login app")
            
            TextField("Enter your username", text: $username)
            
            TextField("Enter your password", text: $password)
            
            SecureField("Password", text: $password)
            
            Button("Login", action: checkLogin)
            
            Text("Login result: \(result)")
            
            
        }
        .padding(50)
    }
    
    func checkLogin() {
        if username == "minhtri" && password == "traidepvn" {
            result = "SUCCESSFUL!!"
            
        } else {
            result = "Failed..."
        }
    }
}

#Preview {
    LoginView()
}
