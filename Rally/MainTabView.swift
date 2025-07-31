import SwiftUI

enum Tab: Int, CaseIterable {
    case home = 0, rally, center, trophies, profile

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
    @State private var selectedTab: Tab = .rally

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        Image(systemName: selectedTab == tab ? tab.selectedIcon : tab.icon)
                        Text(tab.title)
                    }
                    .tag(tab)
            }
        }
        .accentColor(.pink)
    }
}
