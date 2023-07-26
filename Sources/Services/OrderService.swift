class OrderService: Receipt {
    private var bag: [Option] = []

    var total: Int {
        return bag.reduce(0) { result, option in
            if case let .menu(_, _, price, _) = option {
                return result + price
            }
            return result
        }
    }

    var items: [(option: Option, count: Int)] {
        let dict = bag.reduce(into: [:]) { dict, item in
            dict[item, default: 0] += 1
        }
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

    func order(money: Int) -> Bool {
        return money >= total
    }
}
