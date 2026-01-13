//
//  Jan13_BasicSwift.swift
//  hello-ios
//
//  Created by Brian on 13/01/2026.
//

import SwiftUI

struct Jan13_BasicSwift: View {
    @State private var name: String = ""
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var result = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        TextField("Enter your name", text: $name)
            .padding()
//            .textFieldStyle(RoundedBorderTextFieldStyle()) // 3. Optional: Add a visual border
        
//        Text("Hello, \(name)!")
        
        
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


//
//#Preview {
//    Jan13_BasicSwift()
//}
