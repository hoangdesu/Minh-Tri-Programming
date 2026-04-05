//
//  ActivityDetailView.swift
//  hello-ios
//
//  Created by Brian on 05/04/2026.
//

import SwiftUI

struct ActivityDetailView: View {
//    Params for this view
    let activity: String
    
//    this function is called before mounted
    init(activity: String) {
        self.activity = activity
        print("Activity defailt view inited")
    }
    
    var body: some View {
        Text("I love \(activity)")
    }
}

//#Preview {
//    ActivityDetailView()
//}
