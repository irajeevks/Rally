import Foundation

struct RallyEntry: Identifiable {
    let id = UUID()
    let driver: String?
    let codriver: String?
    let car: String?
    let entryNumber: Int?
}