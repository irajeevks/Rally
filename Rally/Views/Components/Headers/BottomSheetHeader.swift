import SwiftUI
struct BottomSheetHeader: View {
    var body: some View {
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
    }
}
