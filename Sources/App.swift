import Foundation

class App {
    static let shared = App()
    typealias CommandOption = (option: Option, command: Command)

    var options: [CommandOption] = []

    func register(option: CommandOption) {
        options.append(option)
    }

    func run() {
        while true {
            let command = selectCommand()
            command.execute()
        }
    }

    private func selectCommand() -> Command {
        while true {
            print("[ SHAKESHACK MENU ]")
            for (option, _) in options {
                print(option.info())
            }
            print("-------------------")
            guard let input = readLine() else { continue }
            return options[Int(input)! - 1].command
        }
    }

    private init() {}
}
