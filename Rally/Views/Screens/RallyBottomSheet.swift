import SwiftUI

struct RallyBottomSheet: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var offset: CGFloat = 550
    @Environment(\.additionalTabInset) var additionalTabInset

    var body: some View {
        ZStack {
            // Glowing background effect
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

            VStack(spacing: 16) {
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(.top, 12)

                HStack {
                    Button(action: {
                        // Back action
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                            Text("Back to Rally")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(20)
                    }

                    Spacer()
                    VStack(alignment: .center) {
                        Text("Entry List")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        Text("125 Entries")
                            .foregroundColor(.cyan)
                            .font(.system(size: 12, weight: .regular))
                    }

                    Spacer()

                    Text("RSAC\nSCOTTISH RALLY\n2025")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 16)
                HStack(spacing: 12) {
                    FilterButton(title: "Select Championship")
                    FilterButton(title: "Select Car Class")
                }
                .padding(.horizontal)

                EntryListView()
                    .safeAreaPadding(.bottom, additionalTabInset)
            }
            .padding(.bottom, 20)
            .background(Color.black)
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .offset(y: additionalTabInset + 34)
        }
        .offset(y: offset + dragOffset.height)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    if value.translation.height < -50 {
                        offset = 0
                    } else if value.translation.height > 50 {
                        offset = 550
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
