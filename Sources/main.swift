import Foundation

let viewer = ConsoleViewer()

let app = App(core: CoreService(
    viewer: viewer,
    orderService: OrderService(),
    waitService: WaitService(
        viewer: viewer,
        queue: DispatchQueue(
            label: "waiting",
            attributes: .concurrent)))
)

app.register(option: .category(
    attr: Option.Attr(id: 1, name: "Burger", desc: "앵거스 비프 통살을 다져만든 버거"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Shack Burger", desc: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"), price: 6900),
        .menu(attr: Option.Attr(id: 2, name: "Shroom Burger", desc: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"), price: 9400),
        .menu(attr: Option.Attr(id: 3, name: "Smoke Burger", desc: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"), price: 8900),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 2, name: "Frozen Custard", desc: "매장에서 신선하게 만드는 아이스크림"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Vanila Frozen Custard", desc: "바닐라맛 Vanila Frozen Custard"), price: 5500),
        .menu(attr: Option.Attr(id: 2, name: "Chocolate Frozen Custard", desc: "초콜릿맛 Chocolate Frozen Custard"), price: 5500),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 3, name: "Drink", desc: "매장에서 직접 만드는 음료"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Cola", desc: "흠뻑 빠질 것만 같은 톡 쏘는 코카콜라"), price: 2500),
        .menu(attr: Option.Attr(id: 2, name: "Cider", desc: "청량한 느낌이 일품인 사이다"), price: 2500),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 4, name: "Beer", desc: "뉴욕 브루클린 브루어리에서 양조한 맥주"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Lager", desc: "브루클린에서 건너온 브루클린 라거"), price: 4500),
        .menu(attr: Option.Attr(id: 2, name: "Brown Ale", desc: "상큼한 브라운 에일"), price: 4500),
    ])
)

app.register(option: .order(
    attr: Option.Attr(id: 5, name: "Order", desc: "장바구니를 확인합니다."),
    actions: [
        .action(attr: Option.Attr(id: 1, name: "Buy", desc: "장바구니에 담은 제품을 구매합니다.")),
        .action(attr: Option.Attr(id: 2, name: "Clear", desc: "장바구니를 비웁니다.")),
    ])
)

app.run()
//
// import Foundation
//
// class HelloWorldTimer {
//    var timer: Timer?
//    var queue: DispatchQueue
//
//    init() {
//        // Timer를 실행할 DispatchQueue를 생성합니다.
//        queue = DispatchQueue(label: "popo", attributes: .concurrent)
//
//        // Timer를 생성하여 5초마다 클로저를 실행합니다.
//        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(printHelloWorld), userInfo: nil, repeats: true)
//
//        // Timer를 해당 DispatchQueue의 RunLoop에 추가하여 Timer가 해당 스레드에서 동작하도록 합니다.
//        queue.async {
//            let runLoop = RunLoop.current
//            runLoop.add(self.timer!, forMode: .common)
//            runLoop.run()
//        }
//    }
//
//    // Timer에 의해 주기적으로 호출되는 메서드
//    @objc private func printHelloWorld() {
//        print("Hello, World")
//    }
//
//    // Timer를 종료하는 메서드
//    func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
// }
//
//// Timer를 다른 스레드에서 시작합니다.
// let helloWorldTimer = HelloWorldTimer()
////
////// 30초 후에 Timer를 종료하는 예시
////DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
////    helloWorldTimer.stopTimer()
////}
//
// while true {
//    guard let input = readLine() else { break }
//    print(input)
// }
//
//// 메인 스레드가 종료되지 않도록 대기합니다.
// dispatchMain()
