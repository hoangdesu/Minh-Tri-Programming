//
//  Ap11_Map.swift
//  hello-ios
//
//  Created by Brian on 11/04/2026.
//

import SwiftUI
import MapKit

struct Apr11_MapView: View {
    @State var mapStyle: MapStyle = .standard
    
//    @State var position = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 10.791610, longitude: 106.722702),
//            span: MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
//        )
//    )
    
    @State private var position: MapCameraPosition = .camera(
        MapCamera(centerCoordinate: .init(latitude: 10.791610, longitude: 106.722702), distance: 1000)
    )
    
    
    
    var body: some View {

        ZStack {
//            Map(/*interactionModes: [.rotate, .zoom]*/)
            Map(position: $position) {
                Marker("Vinhomes", coordinate: CLLocationCoordinate2D(latitude: 10.791610, longitude: 106.722702))
            }
                .mapStyle(mapStyle)
                .onMapCameraChange { context in
//                    print(position.camera?.centerCoordinate)
                    print(context.region.center)
//                    print(UUID())
                }
            
//            Button("Change style") {
//                mapStyle = .standard
//            }
        }
        
//        Button("Get Coordinates") {
//            print(position.)
//        }
        
        Button("Go to UIUC") {
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 40.10958878910658, longitude: -88.22164192960047),
                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                )
            )
        }
       
    }
}

//#Preview {
//    Ap11_Map()
//}
