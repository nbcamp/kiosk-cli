
let app = App.shared

app.register(option: (Burger(), SelectBurgerCommand(
    options: [ShackBurger(), ShroomBurger(), SmokeShack()]
)))
//app.register(option: (FrozenCustard(), SelectBurgerCommand()))
//app.register(option: (Drink(), SelectBurgerCommand()))
//app.register(option: (Beer(), SelectBurgerCommand()))

app.run()
