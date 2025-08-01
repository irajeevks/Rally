import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    @Published var userLocation: CLLocationCoordinate2D?
    @Published var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation() async {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.userLocation = location.coordinate
                self.cameraPosition = .camera(MapCamera(centerCoordinate: location.coordinate, distance: 1000))
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
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
            Map(position: $locationManager.cameraPosition) {
                if let userLocation = locationManager.userLocation {
                    // Custom pin annotation at user location
                    Annotation("", coordinate: userLocation) {
                        Image(.logoStamp)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 62)
                    }
                }
            }
            .ignoresSafeArea()
            .task {
                await locationManager.requestLocation()
            }
            .overlay(alignment: .topTrailing) {
                VStack(spacing: 16) {
                    Menu {
                        Button("Signal", systemImage: "location.fill") {}
                        Button("Video", systemImage: "location.fill") {}
                    } label: {
                        Image(systemName: "square.stack.3d.up.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding(8)
                            .background(Color(.accentNeutral800), in: .circle)
                    }
                    
                    Image(systemName: "location.fill")
                        .font(.title)
                        .foregroundStyle(Color(.systemBlue))
                        .padding(8)
                        .background(Material.regular, in: .rect(cornerRadius: 8))
                }
                .padding(12)
            }
            
            RallyBottomSheet()
        }
        .safeAreaInset(edge: .top) {
            NavigationBarView()
        }
    }
}

#Preview {
    RallyMapView()
}
