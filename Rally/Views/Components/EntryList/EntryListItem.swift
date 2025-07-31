import SwiftUI

struct EntryListItem: View {
    let entry: RallyEntry

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            if let driver = entry.driver, let codriver = entry.codriver {
                InitialsCircle(name: driver, color: .blue)
                InitialsCircle(name: codriver, color: .pink)

                VStack(alignment: .leading, spacing: 2) {
                    Text(driver)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                    Text(entry.car ?? "")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }

                Spacer()

                Text("#\(entry.entryNumber ?? 0)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white.opacity(0.9))
            } else {
                Text("Entry Details To Be Decided")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.1, green: 0.1, blue: 0.2, alpha: 1)))
        .cornerRadius(16)
    }
}
