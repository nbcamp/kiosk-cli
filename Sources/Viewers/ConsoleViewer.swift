import Foundation

struct ConsoleViewer: Viewer {
    func printOptions(title: String, options: [Option]) {
        print("[ ⭐️ WELCOME \(title) ⭐️ ]")
        for option in options {
            print("\(option.id). \(option.info)")
        }
        print(String(repeating: "━", count: 80))
    }

    func printMenus(title: String, menus: [Option]) {
        print("[ 🍔 \(title) MENU 🥤 ]")
        for menu in menus {
            print("\(menu.id). \(menu.info)")
        }
        print(String(repeating: "━", count: 80))
    }

    func printReceipt(receipt: Receipt) {
        if receipt.items.count > 0 {
            print("[ Shopping Bag ]")
            for (option, count) in receipt.items {
                print("\(option.name) x \(count)")
            }
            print()
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            if let total = formatter.string(for: receipt.total) {
                print("🧾 Total Order Price: \(total) WON")
            }
            print(String(repeating: "━", count: 80))
        }
    }

    func selectCategory(categories: [Option]) -> Option {
        let option: Option = prompt("No. ") {
            guard let id = Int($0) else { return nil }
            return categories.first { $0.id == id }
        }
        print()
        return option
    }

    func selectMenu(menus: [Option]) -> Option? {
        let option: Option = selectCategory(categories: menus)
        if case .back = option { return nil }

        print("👉 \(option.info)")
        let answer: String = prompt("장바구니에 추가할까요? (Y/n): ") {
            $0.isEmpty || $0.lowercased() == "y" || $0 == "n" ? $0 : nil
        }
        if answer == "n" {
            print("취소하셨습니다.\n")
            return nil
        }
        print()
        return option
    }

    private func prompt<T>(_ message: String, transform: ((String) -> T?)? = nil) -> T {
        while true {
            print(message, terminator: "")
            guard let input = readLine() else { return "" as! T }
            guard let result = transform?(input) else { continue }
            return result
        }
    }
}
