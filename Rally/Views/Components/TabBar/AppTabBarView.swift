//
//  AppTabBarView.swift
//  Rally
//
//  Created by Rajeev on 31/07/25.
//

import SwiftUI

struct AppTabBarView<Tab: TabItemProvider>: View where Tab.AllCases: RandomAccessCollection, Tab: Identifiable {
    @Binding var selectedTab: Tab
    var body: some View {
        HStack {
            ForEach(Tab.allCases) { tab in
                Button {
                    if selectedTab != tab {
                        selectedTab = tab
                    }
                } label: {
                    tab.image
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
        .background {
            TabBarShape(bumpHeight: 15)
                .fill(LinearGradient(colors: [Color.accentNeutral800, Color.accentNeutral950.opacity(0.5)], startPoint: .bottom, endPoint: .top))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: TabItem = .rally
    List {
        
    }
    .safeAreaInset(edge: .bottom) {
        AppTabBarView(selectedTab: $selectedTab)
    }
}
