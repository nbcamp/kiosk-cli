class OrderService: Receipt {
    private var bag: [Option] = []

    var total: Int {
        return bag.reduce(0) { result, option in
            if case let .menu(_, price) = option {
                return result + price
            }
            return result
        }
    }

    var items: [(option: Option, count: Int)] {
        let dict = bag.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        let items: [(option: Option, count: Int)] = dict.map { ($0.key, $0.value) }
        return items.sorted { $0.count - $1.count > 0 }
    }

    func add(menu: Option) {
        bag.append(menu)
    }

    func remove(menu: Option) {
        if let index = bag.firstIndex(of: menu) {
            bag.remove(at: index)
        }
    }

    func removeAll() {
        bag.removeAll()
    }

    func order(money: Int) -> Int {
        let result = money - total
        if result >= 0 {
            removeAll()
        }
        return result
    }
}
