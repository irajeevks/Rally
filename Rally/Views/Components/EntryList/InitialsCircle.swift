import SwiftUI
struct InitialsCircle: View {
    let name: String
    let color: Color
    let textColor: Color

    var initials: String {
        name.split(separator: " ").compactMap { $0.first }.prefix(2).map(String.init).joined()
    }

    var body: some View {
        HStack {
            Text(initials)
                .font(.appFont(.medium, size: 17))
                .foregroundColor(textColor)
                .frame(width: 36, height: 36)
                .background(color)
                .clipShape(Circle())
            
            Text(name)
                .font(.appFont(.medium, size: 14))
                .padding(.trailing, 16)
                .foregroundStyle(.white)
        }
        .frame(height: 36)
        .background {
            color.opacity(0.25).blur(radius: 8)
        }
        .clipShape(.capsule)
        .background(color.opacity(0.5), in: .capsule)
    }
}
