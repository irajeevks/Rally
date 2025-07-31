import SwiftUI

struct FilterButton: View {
    let title: String

    var body: some View {
        Text(title)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.25, alpha: 1)))
            .cornerRadius(14)
            .foregroundColor(.white)
            .font(.system(size: 13, weight: .medium))
    }
}