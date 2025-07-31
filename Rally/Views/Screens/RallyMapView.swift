import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.first?.coordinate
    }
}

struct RallyAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct RallyMapView: View {
    @StateObject private var locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.5072, longitude: -0.1276), // London default
        span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
    )

    let rallyLocation = CLLocationCoordinate2D(latitude: 51.3851, longitude: -0.2250) // Kings Down Rally

    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [RallyAnnotation(coordinate: rallyLocation)]) { item in
                MapAnnotation(coordinate: item.coordinate) {
                    VStack {
                        Image(systemName: "flag.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.red)
                        Text("Kings Down Rally 2025")
                            .font(.caption2)
                            .padding(4)
                            .background(Color.white)
                            .cornerRadius(6)
                    }
                }
            }
            .onAppear {
                if let userLocation = locationManager.userLocation {
                    region.center = userLocation
                }
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        // Add back navigation action here
                    }) {
                        Text("← Back to Rally")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }

                    Spacer()

                    Text("2500 points earned")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.top, 52)
                .padding(.bottom, 12)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                   startPoint: .top, endPoint: .bottom)
                )

                Spacer()
                RallyBottomSheet()
            }
        }
    }
}
