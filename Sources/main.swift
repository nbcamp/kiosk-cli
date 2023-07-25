import Foundation

// 옵션 프로토콜 - 추상화
protocol Option {
    var id: Int { get }
    var name: String { get }
    var desc: String { get }
}

// 메뉴 프로토콜 - 추상화
protocol Menu {
    var price: Int { get }
}

// 버거, 드링크 프로토콜, 옵션과 메뉴 프로토콜 채택
protocol Burger: Option, Menu {}
protocol Drink: Option, Menu {}

// 버거 상세 메뉴 클래스
class ClassicBurger: Burger {
    var id: Int { 1 }
    var name: String { "클래식버거" }
    var desc: String { "오리지날 소고기 패티" }
    var price: Int { 5_000 }
}

class CheeseBurger: Burger {
    var id: Int { 2 }
    var name: String { "치즈버거" }
    var desc: String { "체다치즈가 듬뿍" }
    var price: Int { 6_000 }
}

// 드링크 상세 메뉴 클래스
class Coke: Drink {
    var id: Int { 1 }
    var name: String { "콜라" }
    var desc: String { "" }
    var price: Int { 2_000 }
}

class Sprite: Drink {
    var id: Int { 2 }
    var name: String { "사이다" }
    var desc: String { "" }
    var price: Int { 2_000 }
}

// 커맨드 패턴
protocol IOInterface {
    func output(_ message: String)
    func input(_ prompt: String, validate: ((String) -> Bool)?) -> String
    func wait()
}

extension IOInterface {
    func input(_ prompt: String) -> String {
        return input(prompt, validate: nil)
    }
}

class TerminalInterface: IOInterface {
    static let shared: TerminalInterface = .init()

    func output(_ message: String) {
        print(message)
    }

    func input(_ prompt: String, validate: ((String) -> Bool)? = nil) -> String {
        while true {
            print(prompt, terminator: "")
            guard let input = readLine() else { exit(1) }
            guard input.count > 0 else { continue }

            if validate?(input) != false {
                return input
            }
        }
    }

    func wait() {
        _ = readLine()
    }

    private init() {}
}

// 오더커맨드 클래스, 커맨드 프로토콜 채택
class OrderMenuCommand: Command {
    var name: String { "주문하기" }
    var orderedMenus: [OrderedMenu] = []

    func execute() {
        let io = TerminalInterface.shared
        io.output("----------장바구니----------")

        if orderedMenus.isEmpty {
            io.output("장바구니가 비어있습니다.")
        } else {
            for (index, menu) in orderedMenus.enumerated() {
                io.output("\(index + 1). \(menu.name) - 가격: \(menu.price)원")
            }

            let totalPrice = orderedMenus.reduce(0) { $0 + $1.price }
            io.output("총합계: \(totalPrice)원")
        }

        io.output("----------------------------")

        io.output("1. 결제")
        io.output("2. 취소")
        io.output("0. 돌아가기")

        let input = io.input("입력: ")

        switch input {
        case "1":
            if orderedMenus.isEmpty {
                io.output("장바구니가 비어있습니다. 주문할 메뉴를 먼저 선택해주세요.")
            } else {
                io.output("결제가 완료되었습니다. 감사합니다!")
                orderedMenus.removeAll()
            }
        case "2":
            io.output("주문이 취소되었습니다.")
            orderedMenus.removeAll()
        case "0":
            break // 아무 작업도 하지 않고 돌아갑니다.
        default:
            io.output("잘못된 입력입니다.")
        }
    }
}

// 주문 커맨드 인스턴스 생성
let orderMenuCommand = OrderMenuCommand()

// 메인화면
func main() {
    let io = TerminalInterface.shared

    while true {
        io.output("-----------메인 메뉴-----------")
        io.output("1. 버거")
        io.output("2. 음료")
        io.output("3. 장바구니")
        io.output("4. 마이포인트")
        io.output("0. 종료")
        io.output("----------------------------")

        let input = io.input("입력: ")

        switch input {
        case "1":
            var backToMainMenu = false
            while !backToMainMenu {
                io.output("--------버거 상세 메뉴--------")
                io.output("1. 클래식버거 | 가격: 5,000원 | 오리지날 소고기 패티")
                io.output("2. 치즈버거 | 가격: 6,000원 | 체다치즈가 듬뿍")
                io.output("0. 돌아가기")
                io.output("--------------------------")

                let burgerInput = io.input("입력: ")

                switch burgerInput {
                case "1":
                    io.output("선택한 버거: 클래식버거")
                    // 클래식버거 처리 로직
                    let classicBurger = ClassicBurger()
                    orderMenuCommand.orderedMenus.append(OrderedMenu(name: classicBurger.name, price: classicBurger.price))
                case "2":
                    io.output("선택한 버거: 치즈버거")
                    // 치즈버거 처리 로직
                    let cheeseBurger = CheeseBurger()
                    orderMenuCommand.orderedMenus.append(OrderedMenu(name: cheeseBurger.name, price: cheeseBurger.price))
                case "0":
                    backToMainMenu = true
                default:
                    io.output("잘못된 입력입니다.")
                }
                io.wait()
            }

        case "2":
            var backToMainMenu = false
            while !backToMainMenu {
                io.output("--------음료 상세 메뉴--------")
                io.output("1. 콜라 | 가격: 2,000원")
                io.output("2. 사이다 | 가격: 2,000원")
                io.output("0. 돌아가기")
                io.output("--------------------------")

                let drinkInput = io.input("입력: ")

                switch drinkInput {
                case "1":
                    io.output("선택한 음료: 콜라")
                    // 콜라 처리 로직
                    let coke = Coke()
                    orderMenuCommand.orderedMenus.append(OrderedMenu(name: coke.name, price: coke.price))
                case "2":
                    io.output("선택한 음료: 사이다")
                    // 사이다 처리 로직
                    let sprite = Sprite()
                    orderMenuCommand.orderedMenus.append(OrderedMenu(name: sprite.name, price: sprite.price))
                case "0":
                    backToMainMenu = true
                default:
                    io.output("잘못된 입력입니다.")
                }
                io.wait()
            }

        case "3":
            // 주문한 메뉴 리스트 보기 및 주문하기
            orderMenuCommand.execute()
            io.wait()
        case "4":
            io.output("마이포인트: ____원")
            io.wait()
        case "0":
            io.output("프로그램을 종료합니다.")
            return

        default:
            io.output("잘못된 입력입니다.")
            io.wait()
        }
    }
}

main()

// 커맨드 프로토콜
protocol Command {
    var name: String { get }

    func execute()
}

// 주문 메뉴 정보 구조체
struct OrderedMenu {
    var name: String
    var price: Int
}
