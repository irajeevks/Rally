import SwiftUI

struct EntryListView: View {
    let entries: [RallyEntry] = [
        .init(driver: "Maximilian Fischer", codriver: "Elena Martinez", car: "Toyota GR Yaris Rally 1", entryNumber: 121),
        .init(driver: "Rafael Silva", codriver: "Bianca Ferreira", car: "Ford Fiesta WRC", entryNumber: 122),
        .init(driver: nil, codriver: nil, car: nil, entryNumber: nil),
        .init(driver: "Pierre Martin", codriver: "Julia White", car: "Citroën C3 WRC", entryNumber: 124),
        .init(driver: "Jason Kim", codriver: "Rina Smith", car: "Skoda Fabia Rally2", entryNumber: 125)
    ]

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