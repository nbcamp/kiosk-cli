
import Foundation
class App {
    static let shared = App()
    let io = TerminalInterface.shared

//    BurgerMenu(), FrozenCustardMenu(), DrinkMenu(), BeerMenu()
    var options: [Option] = []

    func register(option: Option) { options.append(option) }
    func run(
        io: IOInterface
    ) { while true {
        let option = chooseService(io: io)
        option.info()
    }}
    private func chooseService(io: IOInterface) -> Option {
        io.output("[ SHAKESHACK MENU ]")
        for i in options {
            io.output(i.info())
        }
        io.output("-------------------")
        let input = io.input("-> ", validate: {
            guard let value = Int($0) else { return false }
            return Int($0) != nil && (value > 0 && value <= self.options.count)
        })
        return options[Int(input)!]
    }

    private init() {}
}
