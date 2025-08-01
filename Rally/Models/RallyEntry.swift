import Foundation

struct RallyEntry: Identifiable {
    let id = UUID()
    let driver: String?
    let codriver: String?
    let car: String?
    let entryNumber: Int?
}

extension RallyEntry {
    static var samples: [RallyEntry] {
        [
            .init(driver: "Pierre Martin", codriver: "Julia White", car: "Citroën C3 WRC", entryNumber: 124),
            .init(driver: "Luca Moretti", codriver: "Sofia Rossi", car: "Hyundai i20 N Rally1", entryNumber: 125),
            .init(driver: "Ethan Walker", codriver: "Grace Turner", car: "Ford Puma Rally1", entryNumber: 126),
            .init(driver: "Carlos Jiménez", codriver: "Ana López", car: "Škoda Fabia RS Rally2", entryNumber: 127),
            .init(driver: "Tomáš Novák", codriver: "Lucie Kralová", car: "Peugeot 208 Rally4", entryNumber: 128),
            .init(driver: "Johan Andersson", codriver: "Emma Nilsson", car: "Volkswagen Polo GTI R5", entryNumber: 129),
            .init(driver: "Ryota Tanaka", codriver: "Aiko Nakamura", car: "Subaru WRX STI", entryNumber: 130),
            .init(driver: "Daniel Smith", codriver: "Emily Johnson", car: "Toyota GR Yaris Rally1", entryNumber: 131),
            .init(driver: "Mateo Díaz", codriver: "Camila Reyes", car: "Renault Clio Rally4", entryNumber: 132),
            .init(driver: "Oliver Clarke", codriver: "Amelia Reed", car: "Mini John Cooper Works WRC", entryNumber: 133),
        ]
    }
}
