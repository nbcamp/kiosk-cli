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

struct Burger: Option {
    var id: Int { 1 }
    var name: String { "Burger" }
    var desc: String { "앵거스 비프 통살을 다져만든 버거" }
}

struct FrozenCustard: Option {
    var id: Int { 2 }
    var name: String { "FrozenCustard" }
    var desc: String { "매장에서 신선하게 만드는 아이스크림" }
}

struct Drink: Option {
    var id: Int { 3 }
    var name: String { "Drink" }
    var desc: String { "매장에서 직접 만드는 음료" }
}

struct Beer: Option {
    var id: Int { 4 }
    var name: String { "Beer" }
    var desc: String { "뉴욕 브루클린 브루어리에서 양조한 맥주" }
}

struct ShackBurger: MenuOption {
    var id: Int { 1 }
    var name: String { "ShackBurger" }
    var desc: String { "토마토, 양상추, 쉑소스가 토핑된 치즈버거" }
    var price: Int { 6900 }
}

struct ShroomBurger: MenuOption {
    var id: Int { 2 }
    var name: String { "ShroomBurger" }
    var desc: String { "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거" }
    var price: Int { 9400 }
}

struct SmokeShack: MenuOption {
    var id: Int { 3 }
    var name: String { "SmokeShack" }
    var desc: String { "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거" }
    var price: Int { 8900 }
}

struct Cola: MenuOption {
    var id: Int { 1 }
    var name: String { "Cola" }
    var desc: String { "코카콜라" }
    var price: Int { 2500 }
}

struct Cider: MenuOption {
    var id: Int { 2 }
    var name: String { "Cider" }
    var desc: String { "사이다" }
    var price: Int { 2500 }
}

struct VanilaFrozenCustard: MenuOption {
    var id: Int { 1 }
    var name: String { "Vanila Frozen Custard" }
    var desc: String { "바닐라맛 Vanila Frozen Custard" }
    var price: Int { 5500 }
}

struct ChocolateFrozenCustard: MenuOption {
    var id: Int { 2 }
    var name: String { "Chocolate Frozen Custard" }
    var desc: String { "초콜릿맛 Chocolate Frozen Custard" }
    var price: Int { 5500 }
}

struct Lager: MenuOption {
    var id: Int { 1 }
    var name: String { "Lager" }
    var desc: String { "브루클린 라거" }
    var price: Int { 4500 }
}

struct BrownAle: MenuOption {
    var id: Int { 1 }
    var name: String { "BrownAle" }
    var desc: String { "상큼한 브라운 에일" }
    var price: Int { 4500 }
}
