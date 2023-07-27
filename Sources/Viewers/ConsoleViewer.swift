import Foundation

struct ConsoleViewer: Viewer {
    func selectCategory(title: String, options: [Option], receipt: Receipt) -> Option? {
        print("[ ⭐️ WELCOME \(title) ⭐️ ]")
        divider()
        options.forEach { print("\(format(option: $0))") }
        print("0. \(format(name: "Exit", desc: "프로그램을 종료합니다"))")
        divider()

        let input = prompt("No. ") {
            guard let id = Int($0) else { return false }
            return id == 0 || options.contains { $0.attr.id == id }
        }
        print()
        let id = Int(input)!
        if id == 0 { return nil }
        return options.first { $0.attr.id == id }
    }

    func selectMenu(title: String, options: [Option], receipt: Receipt) -> Option? {
        print("[ 🍔 \(title) MENU 🥤 ]")
        divider()
        options.forEach { print("\(format(option: $0))") }
        print("0. \(format(name: "Back", desc: "홈 화면으로 돌아갑니다."))")
        divider()

        let input = prompt("No. ") {
            guard let id = Int($0) else { return false }
            return id == 0 || options.contains { $0.attr.id == id }
        }
        print()
        let id = Int(input)!
        if id == 0 { return nil }
        guard let menu = options.first(where: { $0.attr.id == id }) else { return nil }

        print("\(format(option: menu))")
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

    func selectOrder(title: String, options: [Option], receipt: Receipt) -> Option? {
        print("[ Order Service  ]")
        divider()
        if receipt.items.count > 0 {
            options.forEach { print("\(format(option: $0))") }
            print("0. \(format(name: "Back", desc: "홈 화면으로 돌아갑니다."))")
            divider()
            print("품목 목록")
            receipt.items.forEach { print("\($0.option.attr.name) x \($0.count)")  }
            print("\n🧾 Total Order Price: \(format(number: receipt.total)) WON")
            divider()
            let input = prompt("No. ") {
                guard let id = Int($0) else { return false }
                return id == 0 || options.contains { $0.attr.id == id }
            }
            print()

            let id = Int(input)!
            if id == 0 { return nil }
            return options.first { $0.attr.id == id }
        } else {
            print("장바구니가 비어있습니다. 품목을 선택해주세요.")
            divider()

            print("엔터를 눌러 홈 화면으로 돌아갑니다.", terminator: " ")
            _ = readLine()
            return nil
        }
    }

    func printPaymentResult(success: Bool) {
        if success {
            print("결제가 정상적으로 처리되었습니다. 감사합니다.")
        } else {
            print("잔액 부족으로 결제에 실패했습니다.")
        }
        print()
    }

    private func format(option: Option) -> String {
        switch option {
        case let .category(attr, _),
             let .order(attr, _),
             let .action(attr):
            return "\(attr.id). \(padEnd(attr.name)) │ \(attr.desc)"
        case let .menu(attr, price):
            let shortPrice = String(format: "%.1f", Double(price) / 1000.0)
            return "\(attr.id). \(padEnd(attr.name)) │ W \(shortPrice) │ \(attr.desc)"
        }
    }

    private func format(name: String, desc: String) -> String {
        return "\(padEnd(name)) │ \(desc)"
    }

    private func format(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: number)!
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
