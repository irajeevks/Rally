import SwiftUI
struct FilterButton: View {
    let title: String
    let strokeColor: Color
    let menuItems: [String]

    var body: some View {
        Menu {
            ForEach(menuItems, id: \.self) { item in
                Button(item) {}
            }
        } label: {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .font(.appFont(.medium, size: 13))
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.clear, in: .capsule)
            .overlay {
                Capsule()
                    .stroke(strokeColor, lineWidth: 1)
            }
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.accentNeutral750, .accentNeutral800], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        FilterButton(title: "Select Championship", strokeColor: .accentNeutralPink, menuItems: [
            "F1",
            "NRL",
            "AFL",
            "MLB",
            "NBA",
            "MLS",
            "WHL"
        ])
        .padding()
    }
}
