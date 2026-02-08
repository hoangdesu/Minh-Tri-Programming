//
//  Jan17_List.swift
//  hello-ios
//
//  Created by Brian on 17/01/2026.
//

import SwiftUI

struct Jan17_List: View {
//    var body: some View {
//        Form {
//            ForEach(0..<20000) { number in
//                Text("Row \(number)")
//            }
//        }
//
//    }
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
//        NavigationStack {
//            Form {
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//        }
        
        NavigationView {
            List {
//                Button("Hello World") {
//                Text("Hello World")
//                Text("Hello World")
                
                ForEach(students, id: \.self) {
//                    Button("Click") {
//                        print("Click on student \($0)")
//                    }
                    
                    Text($0)
                }
                
//                for student in students {
//                    
//                }
                
                    
                
                
            }
            .navigationTitle("Dynamic rendering")
        }
        
    }
}

#Preview {
    Jan17_List()
}
