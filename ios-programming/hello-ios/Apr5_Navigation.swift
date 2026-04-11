//
//  Apr5.swift
//  hello-ios
//
//  Created by Brian on 05/04/2026.
//

import SwiftUI

struct Apr5_Navigation: View {
    let activities = ["Bouldering", "Running", "Gym"]
    let API_URL = "https://www.fruityvice.com/api/fruit/all"
    
    @State var fruits = [Fruit]()
    
    init() {
        fetchFruits()
    }
    
    func fetchFruits() {
        guard let url = URL(string: API_URL) else { return }
                
        URLSession.shared.dataTask(with: url) { (data, res, err ) in
            // remove unwanted "null" string from the data
//            guard let data = data?.parseData(removeString: "null,") else { return }
            
            // using JSON decoder to decode from data (string) to Swift dictionary, and return an array of Pokemon
            guard let decodedFruits = try? JSONDecoder().decode([Fruit].self, from: data!) else { return }
            
            // reload data on the main thread
            DispatchQueue.main.async {
                print("fruits", fruits) // TODO: fix, currently list empty
                self.fruits = decodedFruits
            }
        }.resume()
    }

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        NavigationStack {
//            Mar27_RenderListView()
//        }
//        NavigationLink {
//            
//        }
        
//        NavigationLink {
////            FolderDetail(id: workFolder.id)
//            Mar27_RenderListView()
//        } label: {
//            Label("Go to different view", systemImage: "folder")
//            Button("Go to different view")
//        }
        
//        NavigationView {
//            NavigationLink(
//                destination: Mar27_RenderListView(),
//                label: { Text("Next") }
//            )
//        }
        
        
        NavigationStack {
            List {
                ForEach(activities, id: \.self) { eachActivity in
                    NavigationLink {
                        ActivityDetailView(activity: eachActivity)
                    } label: {
                        Text(eachActivity)
                    }
                }
                NavigationLink {
                    Apr11_Map()
                } label: {
                    Label("Strava run (GPX map)", systemImage: "map")
                }
            }
            .navigationTitle("Activities")
        }
            
            
//            NavigationLink {
////                Mar27_RenderListView()
//                
//            } label: {
//                Text("Go next")
//            }
            
        
    }
}

//#Preview {
//    Apr5()
//}
