import SwiftUI

struct InitialsCircle: View {
    let name: String
    let color: Color

    var initials: String {
        name.split(separator: " ").compactMap { $0.first }.prefix(2).map(String.init).joined()
    }

    var body: some View {
        Text(initials)
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 36, height: 36)
            .background(color)
            .clipShape(Circle())
    }
}