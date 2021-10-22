//
//  MapKit.swift
//  SwfitUI_Exercise
//
//  Created by Do Yi Lee on 2021/10/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37, longitude: 120),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
}

struct MapKit_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
