struct SelectBurgerCommand: Command {
    let options: [MenuOption]
    
    init(options: [MenuOption]) {
        self.options = options
    }
    
    func execute() {
        let option = selectOption()
        print("\(option.name)을 선택하셨습니다.")
    }

    func selectOption() -> MenuOption {
        while true {
            print("[ Burger MENU ]")
            for option in options {
                print(option.info())
            }
            print("-------------------")
            guard let input = readLine() else { continue }
            return options[Int(input)! - 1]
        }
    }
}
