import SwiftUI
struct GlowingBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.pink.opacity(0.4)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .blur(radius: 60)
            .opacity(0.6)
            .offset(y: 40)
    }
}
