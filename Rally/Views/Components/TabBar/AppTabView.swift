//
//  AppTabBarView.swift
//  Rally
//
//  Created by Rajeev on 31/07/25.
//

import Foundation
import SwiftUI

struct AppTabView<Content: View, Tab: RandomAccessCollection>: View where Tab.Element: Identifiable, Tab.Element: TabItemProvider, Tab.Element.AllCases: RandomAccessCollection {
    var items: Tab
    @Binding var selectedTab: Tab.Element
    @ViewBuilder var content: (Tab.Element) -> Content
    @State private var additionalTabInset: CGFloat = 0
    
    var body: some View {
        content(selectedTab)
            .environment(\.additionalTabInset, additionalTabInset)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                AppTabBarView(selectedTab: $selectedTab)
                    .onGeometryChange(for: CGFloat.self, of: \.size.height) { newValue in
                        self.additionalTabInset = newValue
                    }
            }
    }
}

#Preview("App Tab") {
    @Previewable @State var selectedItem: TabItem = .rally
    AppTabView(items: TabItem.allCases, selectedTab: $selectedItem) { tabItem in
        tabItem.view
    }
}
