//
//  MapKitDemoView.swift
//
//  Drop this file into any new SwiftUI iOS project.
//  Add NSLocationWhenInUseUsageDescription to Info.plist to enable user location.
//  Requires iOS 17+
//

import CoreLocation
import SwiftUI
import MapKit

// MARK: - Model

struct Place: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let subtitle: String
    let coordinate: CLLocationCoordinate2D
    let color: Color
    let icon: String

    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Main View

struct MapKitDemoView1: View {

    // Sample locations around San Francisco
    let places: [Place] = [
        Place(name: "Golden Gate Bridge",
              subtitle: "Iconic suspension bridge spanning the Golden Gate strait.",
              coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783),
              color: .orange, icon: "building.columns"),
        Place(name: "Alcatraz Island",
              subtitle: "Former federal penitentiary on a rocky island in the Bay.",
              coordinate: CLLocationCoordinate2D(latitude: 37.8267, longitude: -122.4230),
              color: .red, icon: "lock.fill"),
        Place(name: "Fisherman's Wharf",
              subtitle: "Famous waterfront neighborhood full of seafood and sea lions.",
              coordinate: CLLocationCoordinate2D(latitude: 37.8080, longitude: -122.4177),
              color: .blue, icon: "fish.fill"),
        Place(name: "Twin Peaks",
              subtitle: "Two prominent hills offering panoramic views of the city.",
              coordinate: CLLocationCoordinate2D(latitude: 37.7544, longitude: -122.4477),
              color: .green, icon: "mountain.2.fill"),
        Place(name: "Ferry Building",
              subtitle: "Historic marketplace on the Embarcadero waterfront.",
              coordinate: CLLocationCoordinate2D(latitude: 37.7955, longitude: -122.3937),
              color: .purple, icon: "ferry.fill"),
    ]

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7949, longitude: -122.4294),
            span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12)
        )
    )

    @State private var selectedPlace: Place? = nil
    @State private var mapStyle: MapStyleOption = .standard
    @State private var showStylePicker = false
    @State private var locationManager = CLLocationManager()

    var body: some View {
        ZStack(alignment: .top) {
            // MARK: Map
            Map(position: $position, selection: $selectedPlace) {
                // User location dot
                UserAnnotation()

                // Custom annotations for each place
                ForEach(places) { place in
                    Annotation(place.name, coordinate: place.coordinate, anchor: .bottom) {
                        AnnotationView(place: place, isSelected: selectedPlace?.id == place.id)
                            .onTapGesture { selectedPlace = place }
                    }
                    .tag(place)
                }

                // Example circle overlay around Golden Gate
                MapCircle(
                    center: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783),
                    radius: 400
                )
                .foregroundStyle(.orange.opacity(0.12))
                .stroke(.orange.opacity(0.5), lineWidth: 1.5)
            }
            .mapStyle(mapStyle.style)
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .ignoresSafeArea()

            // MARK: Top bar
            VStack(spacing: 0) {
                topBar

                Spacer()

                // MARK: Bottom card
                if let place = selectedPlace {
                    PlaceCard(place: place) {
                        withAnimation { selectedPlace = nil }
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .padding()
                }
            }
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
        .sheet(isPresented: $showStylePicker) {
            MapStylePicker(selected: $mapStyle)
                .presentationDetents([.height(280)])
        }
    }

    // MARK: Top Bar

    var topBar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("SF Explorer")
                    .font(.title2.bold())
                Text("\(places.count) places")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 14))

            Spacer()

            Button {
                showStylePicker = true
            } label: {
                Label("Style", systemImage: "map")
                    .font(.subheadline.weight(.medium))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 14))
            }
            .tint(.primary)
        }
        .padding()
    }
}

// MARK: - Annotation View

struct AnnotationView: View {
    let place: Place
    let isSelected: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(place.color)
                .frame(width: isSelected ? 48 : 36, height: isSelected ? 48 : 36)
                .shadow(color: place.color.opacity(0.5), radius: isSelected ? 8 : 4)

            Image(systemName: place.icon)
                .font(isSelected ? .body : .caption)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
        .animation(.spring(response: 0.3), value: isSelected)
        .overlay(alignment: .bottom) {
            // Callout triangle
            Triangle()
                .fill(place.color)
                .frame(width: 10, height: 7)
                .offset(y: isSelected ? 27 : 21)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            p.closeSubpath()
        }
    }
}

// MARK: - Place Card

struct PlaceCard: View {
    let place: Place
    let onDismiss: () -> Void

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle().fill(place.color.opacity(0.15))
                    .frame(width: 52, height: 52)
                Image(systemName: place.icon)
                    .font(.title3)
                    .foregroundStyle(place.color)
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(place.name)
                    .font(.headline)
                Text(place.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(16)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.12), radius: 12, y: 4)
    }
}

// MARK: - Map Style Picker

enum MapStyleOption: String, CaseIterable, Identifiable {
    case standard = "Standard"
    case hybrid = "Hybrid"
    case satellite = "Satellite"
    case realistic = "3D Terrain"

    var id: String { rawValue }

    var style: MapStyle {
        switch self {
        case .standard:   return .standard
        case .hybrid:     return .hybrid
        case .satellite:  return .imagery
        case .realistic:  return .standard(elevation: .realistic)
        }
    }

    var icon: String {
        switch self {
        case .standard:  return "map"
        case .hybrid:    return "globe.americas.fill"
        case .satellite: return "satellite"
        case .realistic: return "mountain.2.fill"
        }
    }
}

struct MapStylePicker: View {
    @Binding var selected: MapStyleOption
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Map Style")
                .font(.title3.bold())
                .padding(.horizontal)
                .padding(.top)

            ForEach(MapStyleOption.allCases) { option in
                Button {
                    selected = option
                    dismiss()
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: option.icon)
                            .frame(width: 28)
                            .foregroundStyle(.blue)
                        Text(option.rawValue)
                            .foregroundStyle(.primary)
                        Spacer()
                        if selected == option {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.blue)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(selected == option ? Color.blue.opacity(0.08) : Color.clear)
                }
            }

            Spacer()
        }
    }
}

// MARK: - Preview

//#Preview {
//    MapKitDemoView()
//}
