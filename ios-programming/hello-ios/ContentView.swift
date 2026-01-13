//
//  ContentView.swift
//  hello-ios
//
//  Created by Brian on 11/01/2026.
//

import SwiftUI


struct ContentView: View {
    @State var user = "world"
    @State var hasUser = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, " + user)
            
            Button("\(user) is speaking") {
                if (!hasUser) {
                    user = "Brian"
                } else {
                    user = "World"
                }
                
                hasUser = !hasUser
                
                print(user)
            }
        }
        .padding()
    }
}
//
//#Preview {
//    ContentView()
//}
