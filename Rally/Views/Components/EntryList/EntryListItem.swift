import SwiftUI

struct EntryListItem: View {
    let entry: RallyEntry

    var body: some View {
        VStack(alignment: .leading) {
            if let driver = entry.driver, let codriver = entry.codriver {
                HStack {
                    InitialsCircle(name: driver, color: .blue)
                    InitialsCircle(name: codriver, color: .pink)
                }
                .zIndex(100)

                VStack(alignment: .leading, spacing: 2) {
                    Text(driver)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                    Text(entry.car ?? "")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }

                Spacer()
            } else {
                Text("Entry Details To Be Decided")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 12)
        .padding(.horizontal)
        .background {
            HStack {
                Spacer()
                Text("#\(entry.entryNumber ?? 0)")
                    .font(.appFont(.bold, size: 65))
                    .foregroundColor(.white.opacity(0.5))
            }
            .offset(x: -8, y: 16)
        }
        .background(LinearGradient(colors: [Color(.accentNeutral800), Color(.accentNeutral950)], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(16)
    }
}
