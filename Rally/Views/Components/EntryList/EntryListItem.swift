import SwiftUI
struct EntryListItem: View {
    let entry: RallyEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let driver = entry.driver, let codriver = entry.codriver {
                HStack {
                    InitialsCircle(name: driver, color: .accentNeutralUltraLightBlue, textColor: .black)
                    InitialsCircle(name: codriver, color: .accentNeutralPink, textColor: .white)
                }

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
                    .foregroundColor(.tertiary200)
                    .opacity(0.75)
            }
            .offset(x: -12, y: 24)
        }
        .background(LinearGradient(colors: [Color(.accentNeutral800), Color(.accentNeutral950)], startPoint: .leading, endPoint: .trailing))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.accentNeutral750, lineWidth: 1)
        }
        .cornerRadius(16)
    }
}

#Preview {
    ScrollView {
        LazyVStack {
            EntryListItem(entry: RallyEntry.samples[0])
        }
        .padding()
    }
}
