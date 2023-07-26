import Foundation

enum Option: Equatable, Hashable {
    case category(id: Int, name: String, desc: String, menus: [Option])
    case menu(id: Int, name: String, desc: String, price: Int)
    case exit(id: Int)
    case back(id: Int)
}

extension Option {
    var id: Int {
        switch self {
        case let .category(id, _, _, _),
             let .menu(id, _, _, _),
             let .exit(id),
             let .back(id):
            return id
        }
    }

    var name: String {
        switch self {
        case let .category(_, name, _, _),
             let .menu(_, name, _, _):
            return name
        case .exit: return "exit"
        case .back: return "back"
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
    var info: String {
        switch self {
        case let .category(_, name, desc, _):
            return "\(padEnd(name)) │ \(desc)"
        case let .menu(_, name, desc, price):
            let p = String(format: "%.1f", Double(price) / 1000.0)
            return "\(padEnd(name)) │ W \(p) │ \(desc)"
        case .exit:
            return "\(padEnd("Exit")) │ 프로그램 종료"
        case .back:
            return "\(padEnd("Back")) │ 뒤로가기"
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
