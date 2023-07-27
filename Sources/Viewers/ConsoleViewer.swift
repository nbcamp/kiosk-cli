import Foundation

struct ConsoleViewer: Viewer {
    func printOptions(title: String, options: [Option]) {
        print("[ ⭐️ WELCOME \(title) ⭐️ ]")
        options.forEach { print("\($0.id). \(format(option: $0))") }
        print("0. \(format(name: "Exit", desc: "프로그램을 종료합니다."))")
        divider()
    }

    func printMenus(title: String, menus: [Option]) {
        print("[ 🍔 \(title) MENU 🥤 ]")
        menus.forEach { print("\($0.id). \(format(option: $0))") }
        print("0. \(format(name: "Back", desc: "홈 화면으로 돌아갑니다."))")
        divider()
    }

    func printOrder(receipt: Receipt) {
        if receipt.items.count > 0 {
            print("[ Shopping Bag ]")
            for (option, count) in receipt.items {
                print("\(option.name) x \(count)")
            }
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            if let total = formatter.string(for: receipt.total) {
                print("\n🧾 Total Order Price: \(total) WON")
            }
            divider()
        }
    }

    func selectCategory(categories: [Option]) -> Option? {
        let input = prompt("No. ") {
            guard let id = Int($0) else { return false }
            return id == 0 || categories.contains { $0.id == id }
        }

        print()
        let id = Int(input)!
        return id == 0 ? nil : categories.first { $0.id == id }
    }

    func selectMenu(menus: [Option]) -> Option? {
        guard let menu = selectCategory(categories: menus) else { return nil }

        print("👉 \(format(option: menu))")
        let answer = prompt("장바구니에 추가할까요? (Y/n): ") {
            $0.isEmpty || $0.lowercased() == "y" || $0 == "n"
        }
        if answer == "n" {
            print("취소하셨습니다.\n")
            return nil
        }
        print()
        return menu
    }

    private func format(option: Option) -> String {
        switch option {
        case let .category(_, name, desc, _):
            return "\(padEnd(name)) │ \(desc)"
        case let .menu(_, name, desc, price):
            let p = String(format: "%.1f", Double(price) / 1000.0)
            return "\(padEnd(name)) │ W \(p) │ \(desc)"
        }
    }

    private func format(name: String, desc: String) -> String {
        return "\(padEnd(name)) │ \(desc)"
    }

    private func padEnd(_ str: String, length: Int = 30) -> String {
        return str.padding(toLength: length, withPad: " ", startingAt: 0)
    }

    private func prompt(_ message: String, validate: ((String) -> Bool)? = nil) -> String {
        while true {
            print(message, terminator: "")
            guard let input = readLine() else { return "" }
            guard validate?(input) != false else { continue }
            return input
        }
    }

    private func divider(length: Int = 80) {
        print(String(repeating: "━", count: 80))
    }
}
