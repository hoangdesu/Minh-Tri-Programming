//
//  Mar27_RenderListView.swift
//  hello-ios
//
//  Created by Brian on 27/03/2026.
//

import SwiftUI

//let: constant
//var: variable

struct Mar27_RenderListView: View {
    let activities = ["Bouldering", "Running", "Gym"]
    
    var body: some View {
//        HStack {
//            NavigationView {
//                List {
//                    ForEach(activities, id: \.self) {
//                        // In SwiftUI, $0 is a shorthand argument name used in closures — it refers to the first argument passed to the closure.
//                        Text($0)
//                    }
//                }
//                .navigationTitle("Favorite activities")
//            }
//            
//            NavigationStack {
//                List {
//                    Text("line 1")
//                    Text("line 2")
//                    Text("line 3")
//                }
//                .navigationTitle("Lines")
//            }
//        }
        
        NavigationStack {
            List {
                ForEach(activities, id: \.self) { eachActivity in
//                    Text($0) // annonymous argument
                    
//                    Button($0) {
//                        print($0)
//                    }
                    
//                    Text(eachActivity)
//                    Button(eachActivity) {
//                        print("I love \(eachActivity)")
//                    }
                    
                    Button(eachActivity, action: { onActBtnClicked(activity: eachActivity)
                    })
                }
            }
            .navigationTitle("Favorite activities")
        }
        
        
//        binding onclick event on button
        Button("Click me") {
            print("wassup")
        }
        
        Button("Click me again!!", action: onBtnClick)

    }
    
    func onBtnClick() {
        print("sup bro!")
    }
    
    func onActBtnClicked(activity: String) {
        print("I love \(activity)")
    }
}

//#Preview {
//    Mar27_RenderListView()
//}

//Array methods: functions that operate on top of an array
