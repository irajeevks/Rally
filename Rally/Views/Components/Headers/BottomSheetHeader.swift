import SwiftUI

struct BottomSheetHeader: View {
    var body: some View {
        HStack {
            Button("← Back to Rally") {}
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            VStack {
                Text("Entry List")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                Text("125 Entries")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            Spacer()
            Text("2500 points earned")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}