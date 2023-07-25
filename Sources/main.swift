import Foundation
let app = App.shared
let io: IOInterface = TerminalInterface.shared

app.register(option: BurgerMenu())
app.register(option: FrozenCustardMenu())
app.register(option: DrinkMenu())
app.register(option: BeerMenu())

app.run(io: io)
