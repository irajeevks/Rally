import SwiftUI

struct FilterDropdown: View {
    let title: String
    @State private var selection: String = ""

    var body: some View {
        Menu {
            Button("All", action: { selection = "All" })
            Button("WRC", action: { selection = "WRC" })
            Button("WRC2", action: { selection = "WRC2" })
        } label: {
            HStack {
                Text(selection.isEmpty ? title : selection)
                Image(systemName: "chevron.down")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
    }
}