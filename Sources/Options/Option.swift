import Foundation

enum Option: Equatable, Hashable {
    case category(name: String, desc: String, options: [Option])
    case menu(name: String, desc: String, price: Int, options: [Option])
}

extension Option {
    var name: String {
        switch self {
        case let .category(name, _, _):
            fallthrough
        case let .menu(name, _, _, _):
            return name
        }
    }

    var info: String {
        switch self {
        case let .category(name, desc, _):
            return "\(padEnd(name)) | \(desc)"
        case let .menu(name, desc, price, _):
            let p = String(format: "%.1f", Double(price) / 1000.0)
            return "\(padEnd(name)) | W \(p) | \(desc)"
        }
    }

    private func padEnd(_ str: String, length: Int = 30) -> String {
        return str.padding(toLength: length, withPad: " ", startingAt: 0)
    }
}

extension Option {
    func hash(into hasher: inout Hasher) {
        hasher.combine(info)
    }
}
