import SwiftUI

enum TabItem: Int, CaseIterable, Identifiable {
    case home = 0, rally, center, trophies, profile
    
    var id: Int { self.rawValue }

    var title: String {
        switch self {
        case .home: return "Home"
        case .rally: return "Rally"
        case .center: return ""
        case .trophies: return "Trophies"
        case .profile: return "Profile"
        }
    }

    var icon: String {
        switch self {
        case .home: return "house"
        case .rally: return "map"
        case .center: return "plus.circle"
        case .trophies: return "trophy"
        case .profile: return "person"
        }
    }
    
    var image: Image {
        switch self {
        case .home:
            Image(.house)
        case .rally:
            Image(.rally)
        case .center:
            Image(.photo)
        case .trophies:
            Image(.trophy)
        case .profile:
            Image(.accounts)
        }
    }

    var selectedIcon: String {
        return icon + ".fill"
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .home: Text("Home")
        case .rally: RallyMapView()
        case .center: Text("Center")
        case .trophies: Text("Trophies")
        case .profile: Text("Profile")
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab: TabItem = .rally

    var body: some View {
        AppTabView(items: TabItem.allCases, selectedTab: $selectedTab) { tabItem in
            tabItem.view
        }
    }
}

extension TabItem: TabItemProvider {}
