import SwiftUI

struct FilterDropdown: View {
    let title: String
    let options: [String]
    @Binding var selected: String

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selected = option
                }
            }
        } label: {
            Text(selected)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color.white.opacity(0.1))
                .cornerRadius(14)
                .foregroundColor(.white)
                .font(.system(size: 13, weight: .medium))
        }
    }
}
