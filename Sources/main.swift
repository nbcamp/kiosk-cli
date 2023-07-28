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
        .menu(attr: Option.Attr(id: 2, name: "Smoke Burger", desc: "베이컨, 체리 페퍼, 쉑소스가 들어간 치즈버거"), price: 8900),
        .menu(attr: Option.Attr(id: 3, name: "Shroom Burger", desc: "치즈로 속을 채운 베지테리안 버거"), price: 9400),
        .menu(attr: Option.Attr(id: 4, name: "Shack Stack", desc: "슈룸 버거, 쉑버거의 맛을 즐길 수 있는 메뉴"), price: 9900),
        .menu(attr: Option.Attr(id: 5, name: "Cheeseburger", desc: "포테이토 번, 비프패티, 치즈를 담은 치즈버거"), price: 6900),
        .menu(attr: Option.Attr(id: 6, name: "Hamburger", desc: "포테이토 번, 비프패티, 신선한 재료를 담은 버거"), price: 5400),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 2, name: "Flat-Top Degs", desc: "참나무칩으로 훈연한 소시지가 들어간 핫 도그"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Stack-cago Dog", desc: "여러가지 토핑을 올린 시카고식 핫 도그"), price: 5500),
        .menu(attr: Option.Attr(id: 2, name: "Hot Dog", desc: "비프 소시지가 들어간 담백한 핫 도그"), price: 4400),
        .menu(attr: Option.Attr(id: 3, name: "Prok Dog", desc: "포크 소시지가 들어간 담백한 핫 도그"), price: 4400),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 3, name: "Frozen Custard", desc: "매장에서 신선하게 만드는 아이스크림"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Shakes", desc: "바닐라, 초콜렛, 솔티드 카라멜, 스트로베리, 커피"), price: 5900),
        .menu(attr: Option.Attr(id: 2, name: "Shake of the Week", desc: "특별한 커스터드 플레이버"), price: 6500),
        .menu(attr: Option.Attr(id: 3, name: "Red Bean Shake", desc: "신선한 커스터드와 레드빈이 블렌딩 된 시즈널 쉐이크"), price: 6500),
        .menu(attr: Option.Attr(id: 4, name: "Floats", desc: "루트 비어, 퍼플 카우, 크림시클"), price: 5900),
        .menu(attr: Option.Attr(id: 5, name: "Cups & Cones", desc: "바닐라, 초콜렛, Flavor of the Week"), price: 4900),
        .menu(attr: Option.Attr(id: 6, name: "Concretes", desc: "쫀득한 커스터드와 다양한 믹스-인의 조합"), price: 5900),
        .menu(attr: Option.Attr(id: 7, name: "Shack Attack", desc: "다양한 소스와 토핑을 첨가한 초콜렛 커스터드"), price: 4900),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 4, name: "Drink", desc: "매장에서 직접 만드는 상큼한 음료"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Shack-made Lemonade", desc: "매장에서 직접 만드는 상큼한 레몬에이드"), price: 3900),
        .menu(attr: Option.Attr(id: 2, name: "Fresh Brewed Iced Tea", desc: "직접 유기농 홍차로 우려낸 아이스티"), price: 3400),
        .menu(attr: Option.Attr(id: 3, name: "Fifty/Fifty", desc: "레몬에이드와 아이스티의 만남"), price: 3500),
        .menu(attr: Option.Attr(id: 4, name: "Abita Root Beer", desc: "청량감 있는 독특한 미국식 무알콜 탄산음료"), price: 4400),
        .menu(attr: Option.Attr(id: 5, name: "Bottled Water", desc: "지리산 암반대수층으로 마든 프리미엄 생수"), price: 1000),
    ])
)

app.register(option: .category(
    attr: Option.Attr(id: 5, name: "Beer", desc: "뉴욕 브루클린 브루어리에서 양조한 맥주"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "SmakeMeister Ale", desc: "뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주"), price: 9800),
        .menu(attr: Option.Attr(id: 2, name: "Magpie Brewing Co.", desc: "Pale Ale, Porter, Wheat"), price: 6800),
        .menu(attr: Option.Attr(id: 3, name: "The Hand and Malt.", desc: "IPA, Mocha Stout"), price: 6800),
    ])
)

app.register(option: .order(
    attr: Option.Attr(id: 6, name: "Order", desc: "장바구니를 확인합니다."),
    actions: [
        .action(attr: Option.Attr(id: 1, name: "Buy", desc: "장바구니에 담은 제품을 구매합니다.")),
        .action(attr: Option.Attr(id: 2, name: "Clear", desc: "장바구니를 비웁니다.")),
    ])
)

app.run()
