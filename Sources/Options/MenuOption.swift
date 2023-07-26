import Foundation

protocol Menu {
    var price: Int { get }
}

protocol MenuOption: Option, Menu {}

extension MenuOption {
    func info() -> String {
        let price = String(format: "%.1f", Double(self.price) / 1000.0)
        return "\(id). \(name.padding(toLength: 30, withPad: " ", startingAt: 0)) | W \(price) | \(desc)"
    }
}
