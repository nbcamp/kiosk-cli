import Foundation

enum Option: Equatable, Hashable {
    case category(id: Int, name: String, desc: String, menus: [Option])
    case menu(id: Int, name: String, desc: String, price: Int)
}

extension Option {
    var id: Int {
        switch self {
        case let .category(id, _, _, _),
             let .menu(id, _, _, _):
            return id
        }
    }

    var name: String {
        switch self {
        case let .category(_, name, _, _),
             let .menu(_, name, _, _):
            return name
        }
    }

    var menus: [Option] {
        switch self {
        case let .category(_, _, _, menus): return menus
        default: return []
        }
    }
}

extension Option {
    func hash(into hasher: inout Hasher) {
        switch self {
        case let .category(id, name, desc, _),
             let .menu(id, name, desc, _):
            hasher.combine("\(id) \(name) \(desc)")
        }
    }
}
