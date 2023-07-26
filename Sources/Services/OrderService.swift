class OrderServices {
    private(set) var bag: [MenuOption] = []

    var totalPrice: Int {
        bag.reduce(0) { $0 + $1.price }
    }

    func add(menu: MenuOption) {
        bag.append(menu)
    }

    func remove(menu: MenuOption) {
        if let index = bag.firstIndex(where: { $0.name == menu.name }) {
            bag.remove(at: index)
        }
    }

    func order(money: Int) -> Bool {
        return money >= totalPrice
    }
}
