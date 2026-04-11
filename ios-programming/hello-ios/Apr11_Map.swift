//
//  Apr11_Map.swift
//  hello-ios
//
//  MapKit: load a Strava GPX track and draw it as a polyline.
//

import CoreLocation
import MapKit
import SwiftUI

// MARK: - GPX → coordinates

/// Parses GPX 1.x `<trkpt lat="…" lon="…">` points (Strava exports use this shape).
final class GPXTrackParser: NSObject, XMLParserDelegate {
    private var coordinates: [CLLocationCoordinate2D] = []

    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String: String] = [:]
    ) {
        let tag = qName ?? elementName
        // Strava GPX uses the default GPX namespace; `XMLParser` may report `trkpt` or `{…}trkpt`.
        let isTrackPoint = tag == "trkpt" || tag.hasSuffix("}trkpt") || elementName.hasSuffix("trkpt")
        guard isTrackPoint else { return }
        guard let latStr = attributeDict["lat"],
              let lonStr = attributeDict["lon"],
              let lat = Double(latStr),
              let lon = Double(lonStr)
        else { return }
        coordinates.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
    }

    static func coordinates(from data: Data) -> [CLLocationCoordinate2D] {
        let helper = GPXTrackParser()
        let parser = XMLParser(data: data)
        parser.delegate = helper
        guard parser.parse() else { return [] }
        return helper.coordinates
    }
}

// MARK: - Map region

private func regionFittingCoordinates(_ coordinates: [CLLocationCoordinate2D], paddingFactor: Double = 1.35) -> MKCoordinateRegion {
    guard !coordinates.isEmpty else {
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )
    }
    let latitudes = coordinates.map(\.latitude)
    let longitudes = coordinates.map(\.longitude)
    let minLat = latitudes.min()!
    let maxLat = latitudes.max()!
    let minLon = longitudes.min()!
    let maxLon = longitudes.max()!
    let center = CLLocationCoordinate2D(
        latitude: (minLat + maxLat) / 2,
        longitude: (minLon + maxLon) / 2
    )
    let latDelta = max(maxLat - minLat, 0.001) * paddingFactor
    let lonDelta = max(maxLon - minLon, 0.001) * paddingFactor
    return MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta))
}

// MARK: - View

struct Apr11_Map: View {
    /// GPX in app bundle (see `run-data/run1.gpx` target membership).
    private let gpxResourceName = "run1"

    @State private var coordinates: [CLLocationCoordinate2D] = []
    @State private var loadError: String?
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $position) {
                if coordinates.count >= 2 {
                    MapPolyline(coordinates: coordinates)
                        .stroke(Color.orange, lineWidth: 4)
                }
                if let start = coordinates.first {
                    Annotation("Start", coordinate: start) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 12, height: 12)
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                }
                if let end = coordinates.last, coordinates.count > 1 {
                    Annotation("End", coordinate: end) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 12, height: 12)
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                }
            }
            .mapStyle(.standard)

            if let loadError {
                Text(loadError)
                    .font(.caption)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                    .padding()
            }
        }
        .navigationTitle("Morning Run (GPX)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: loadGPX)
    }

    private func loadGPX() {
        guard let url = Bundle.main.url(forResource: gpxResourceName, withExtension: "gpx") else {
            loadError = "Missing \(gpxResourceName).gpx in bundle — add file to target."
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            loadError = "Could not read GPX data."
            return
        }
        let pts = GPXTrackParser.coordinates(from: data)
        guard pts.count >= 2 else {
            loadError = "No track points found in GPX."
            return
        }
        coordinates = pts
        position = .region(regionFittingCoordinates(pts))
        loadError = nil
    }
}

#Preview {
    NavigationStack {
        Apr11_Map()
    }
}
