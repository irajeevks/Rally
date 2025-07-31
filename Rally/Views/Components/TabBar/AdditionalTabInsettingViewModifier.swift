//
//  AdditionalTabInsettingViewModifier.swift
//  Rally
//
//  Created by Rajeev on 31/07/25.
//

import SwiftUI

struct AdditionalTabInsettingViewModifier: ViewModifier {
    @Environment(\.additionalTabInset) var additionalTabInset
    func body(content: Content) -> some View {
        content
            .safeAreaPadding(.bottom, additionalTabInset)
    }
}

extension EnvironmentValues {
    @Entry var additionalTabInset: CGFloat = 0
}

extension View {
    func additionalTabInsetting() -> some View {
        self.modifier(AdditionalTabInsettingViewModifier())
    }
}
