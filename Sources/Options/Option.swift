import Foundation

enum Option: Equatable, Hashable {
    struct Attr {
        let id: Int
        let name: String
        let desc: String
    }

    case category(attr: Attr, menus: [Option])
    case menu(attr: Attr, price: Int)

    case order(attr: Attr, actions: [Option])
    case action(attr: Attr)
}

extension Option {
    var attr: Attr {
        switch self {
        case let .category(attr, _),
             let .menu(attr, _),
             let .order(attr, _),
             let .action(attr):
            return attr
        }
    }

    var menus: [Option] {
        switch self {
        case let .category(_, menus): return menus
        default: return []
        }
    }
}

extension Option {
    static func == (lhs: Option, rhs: Option) -> Bool {
        return "\(lhs.attr)" == "\(rhs.attr)"
    }
}

extension Option {
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(attr.id) \(attr.name) \(attr.desc)")
    }
}
