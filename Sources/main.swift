let app = App(
    viewer: ConsoleViewer(),
    orderService: OrderService())

app.register(option: .category(
    attr: Option.Attr(id: 1, name: "Burger", desc: "앵거스 비프 통살을 다져만든 버거"),
    menus: [
        .menu(attr: Option.Attr(id: 2, name: "Shroom Burger", desc: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"), price: 9400),
        .menu(attr: Option.Attr(id: 1, name: "Shack Burger", desc: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"), price: 6900),
        .menu(attr: Option.Attr(id: 3, name: "Smoke Burger", desc: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"), price: 8900),
    ]))

app.register(option: .category(
    attr: Option.Attr(id: 2, name: "Frozen Custard", desc: "매장에서 신선하게 만드는 아이스크림"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Vanila Frozen Custard", desc: "바닐라맛 Vanila Frozen Custard"), price: 5500),
        .menu(attr: Option.Attr(id: 2, name: "Chocolate Frozen Custard", desc: "초콜릿맛 Chocolate Frozen Custard"), price: 5500),
    ]))

app.register(option: .category(
    attr: Option.Attr(id: 3, name: "Drink", desc: "매장에서 직접 만드는 음료"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Cola", desc: "흠뻑 빠질 것만 같은 톡 쏘는 코카콜라"), price: 2500),
        .menu(attr: Option.Attr(id: 2, name: "Cider", desc: "청량한 느낌이 일품인 사이다"), price: 2500),
    ]))

app.register(option: .category(
    attr: Option.Attr(id: 4, name: "Beer", desc: "뉴욕 브루클린 브루어리에서 양조한 맥주"),
    menus: [
        .menu(attr: Option.Attr(id: 1, name: "Lager", desc: "브루클린에서 건너온 브루클린 라거"), price: 4500),
        .menu(attr: Option.Attr(id: 2, name: "Brown Ale", desc: "상큼한 브라운 에일"), price: 4500),
    ]))

app.register(option: .order(
    attr: Option.Attr(id: 5, name: "Order", desc: "장바구니를 확인합니다."),
    actions: [
        .action(attr: Option.Attr(id: 1, name: "Buy", desc: "장바구니에 담은 제품을 구매합니다.")),
        .action(attr: Option.Attr(id: 2, name: "Clear", desc: "장바구니를 비웁니다.")),
    ]))

app.run()
