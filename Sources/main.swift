import Foundation

protocol Option {
    var id: Int { get }
    var name: String { get }
    var desc: String { get }
    func info() -> String
}

extension Option {
    func info() -> String {
        return "\(id). \(name)\t\t\t | \(desc)"
    }
}

protocol Menu {
    var price: Int { get }
}

protocol MenuOption: Option, Menu {}

extension MenuOption {
    func info() -> String {
        let price = String(format: "%.1f", self.price / 1000)
        return "\(id). \(name)\t\t\t | W \(price) | \(desc)"
    }
}

protocol Burger: MenuOption {}

protocol FrozenCustard: MenuOption {}

protocol Drink: MenuOption {}

protocol Beer: MenuOption {}

struct ShackBurger: Burger {
    var id: Int { 1 }
    var name: String { "ShackBurger" }
    var desc: String { "토마토, 양상추, 쉑소스가 토핑된 치즈버거" }
    var price: Int { 6900 }
}

struct ShroomBurger: Burger {
    var id: Int { 2 }
    var name: String { "ShroomBurger" }
    var desc: String { "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거" }
    var price: Int { 9400 }
}

struct SmokeShack: Burger {
    var id: Int { 3 }
    var name: String { "SmokeShack" }
    var desc: String { "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거" }
    var price: Int { 8900 }
}

struct Cola: Drink {
    var id: Int { 1 }
    var name: String { "Cola" }
    var desc: String { "코카콜라" }
    var price: Int { 2500 }
}

struct Cider: Drink {
    var id: Int { 2 }
    var name: String { "Cider" }
    var desc: String { "사이다" }
    var price: Int { 2500 }
}

struct VanilaFrozenCustard: FrozenCustard {
    var id: Int { 1 }
    var name: String { "Vanila Frozen Custard" }
    var desc: String { "바닐라맛 Vanila Frozen Custard" }
    var price: Int { 5500 }
}

struct ChocolateFrozenCustard: FrozenCustard {
    var id: Int { 2 }
    var name: String { "Chocolate Frozen Custard" }
    var desc: String { "초콜릿맛 Chocolate Frozen Custard" }
    var price: Int { 5500 }
}

struct Lager: Beer {
    var id: Int { 1 }
    var name: String { "Lager" }
    var desc: String { "브루클린 라거" }
    var price: Int { 4500 }
}

struct BrownAle: Beer {
    var id: Int { 1 }
    var name: String { "BrownAle" }
    var desc: String { "상큼한 브라운 에일" }
    var price: Int { 4500 }
}
