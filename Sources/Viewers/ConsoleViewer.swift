struct ConsoleViewer: Viewer {
    func selectMenu(title: String, options: [Option]) -> Option? {
        guard let option = selectOption(
            title: title,
            options: options
        ) else { return nil }

        switch option {
        case let .category(name, _, options):
            return selectOption(title: name, options: options)
        case let .menu(name, _, _, options):
            return selectOption(title: name, options: options)
        }
    }

    private func selectOption(title: String, options: [Option]) -> Option? {
        print("[ \(title) ]")
        for (index, option) in options.enumerated() {
            print("\(index + 1). \(option.info)")
        }
        print("0. Exit Program 🖐️")
        print("-------------------")
        let input = prompt("입력: ") {
            guard let num = Int($0) else { return false }
            return num >= 0 && num <= options.count
        }
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
