import SwiftUI

struct EntryListView: View {
    let entries: [RallyEntry] = RallyEntry.samples

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(entries) { entry in
                    EntryListItem(entry: entry)
                }
            }
            .padding()
        }
    }
}
