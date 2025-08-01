import SwiftUI

struct RallyBottomSheet: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var offset: CGFloat = 500
    @Environment(\.additionalTabInset) var additionalTabInset

    var body: some View {
        ZStack {

            VStack(spacing: 16) {
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(.top, 12)

                HStack(spacing: 26) {
                    Button(action: {
                        // Back action
                    }) {
                        HStack {
                            Image(.backArrow)
                                .foregroundColor(.white)
                            Text("Back to Rally")
                                .font(.appFont(.bold, size: 18))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.accentNeutral750)
                        .cornerRadius(20)
                    }

                    VStack(alignment: .leading) {
                        Text("Entry List")
                            .foregroundColor(.white)
                            .font(.appFont(.bold, size: 20))
                        Text("125 Entries")
                            .foregroundColor(.cyan)
                            .font(.appFont(.regular, size: 12))
                    }

                    Spacer()

                    Image(.logoStamp)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64)
                }
                .padding(.horizontal, 16)
                
                HStack(spacing: 12) {
                    FilterButton(
                        title: "Select Championship",
                        strokeColor: .accentNeutralPink,
                        menuItems: [
                            "Formula One World Championship",
                            "World Endurance Championship",
                            "World Rally Championship",
                        ]
                    )
                    FilterButton(
                        title: "Select Car Class",
                        strokeColor: .tertiaryTint,
                        menuItems: [
                            "Touring Cars",
                            "Formula Cars (Open-Wheel)",
                            "GT (Grand Touring) Cars"
                        ]
                    )
                }
                .padding(.horizontal)

                EntryListView()
                    .safeAreaPadding(.bottom, additionalTabInset)
            }
            .padding(.bottom, 20)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color.accentNeutral800, .black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .offset(y: additionalTabInset + 34)
        }
        .offset(y: max(0, min(offset + dragOffset.height, 550)))
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    if value.translation.height < -50 {
                        offset = 0
                    } else if value.translation.height > 50 {
                        offset = 500
                    }
                }
        )
        .animation(.easeInOut, value: offset)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    RallyBottomSheet()
}
