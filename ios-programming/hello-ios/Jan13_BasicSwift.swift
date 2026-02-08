//
//  Jan13_BasicSwift.swift
//  hello-ios
//
//  Created by Brian on 13/01/2026.
//

import SwiftUI

struct Jan13_BasicSwift: View {
    @State private var name: String = ""
    

    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        TextField("Enter your name", text: $name)
            .padding()
//            .textFieldStyle(RoundedBorderTextFieldStyle()) // 3. Optional: Add a visual border
        
//        Text("Hello, \(name)!")
        
        LoginView()
        
        
    }
    
    

}


//
//#Preview {
//    Jan13_BasicSwift()
//}
