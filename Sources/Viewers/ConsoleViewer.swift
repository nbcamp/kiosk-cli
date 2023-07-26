import Foundation

struct ConsoleViewer: Viewer {
    func selectMenu(
        title: String,
        options: [Option],
        receipt: Receipt
    ) -> Option? {
        guard let option = selectOption(
            title: title,
            options: options,
            receipt: receipt
        ) else { return nil }

        if case let .category(name, _, options) = option {
            return selectOption(
                title: name,
                options: options,
                receipt: receipt
            )
        }
        return nil
    }

    private func selectOption(
        title: String,
        options: [Option],
        receipt: Receipt
    ) -> Option? {
        print("[ ⭐️ \(title) MENU ⭐️ ]")
        for (index, option) in options.enumerated() {
            print("\(index + 1). \(option.info)")
        }
        if receipt.items.count > 0 {
            print("\n[[ Shopping Bag ]]")
            for (option, count) in receipt.items {
                print("\(option.name) x \(count)")
            }
            print()
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            if let total = formatter.string(for: receipt.total) {
                print("Total Order Price: \(total) WON")
            }
        }
        print()
        print("0. Exit Program ")
        print("-------------------")
        let input = prompt("No. ") {
            guard let num = Int($0) else { return false }
            return num >= 0 && num <= options.count
        }
        print()
        let index = Int(input)! - 1
        return index >= 0 ? options[index] : nil
    }

    private func prompt(_ message: String, validate: ((String) -> Bool)? = nil) -> String {
        while true {
            print(message, terminator: "")
            guard let input = readLine() else { return "" }
            guard input.count > 0 else { continue }
            guard validate?(input) != false else { continue }

            return input
        }
    }
}
