let app = App(
    viewer: ConsoleViewer(),
    orderService: OrderService()
)

app.register(option: .category(name: "Burger", desc: "앵거스 비프 통살을 다져만든 버거", options: [
    .menu(name: "Shack Burger", desc: "토마토, 양상추, 쉑소스가 토핑된 치즈버거", price: 6900, options: []),
    .menu(name: "Shroom Burger", desc: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거", price: 9400, options: []),
    .menu(name: "Smoke Burger", desc: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거", price: 8900, options: []),
]))

app.register(option: .category(name: "Frozen Custard", desc: "매장에서 신선하게 만드는 아이스크림", options: [
    .menu(name: "Vanila Frozen Custard", desc: "바닐라맛 Vanila Frozen Custard", price: 5500, options: []),
    .menu(name: "Chocolate Frozen Custard", desc: "초콜릿맛 Chocolate Frozen Custard", price: 5500, options: []),
]))

app.register(option: .category(name: "Drink", desc: "매장에서 직접 만드는 음료", options: [
    .menu(name: "Cola", desc: "흠뻑 빠진 것만 같은 톡 쏘는 코카콜라", price: 2500, options: []),
    .menu(name: "Cider", desc: "청량한 느낌이 일품인 사이다", price: 2500, options: []),
]))

app.register(option: .category(name: "Beer", desc: "뉴욕 브루클린 브루어리에서 양조한 맥주", options: [
    .menu(name: "Lager", desc: "브루클린에서 건너온 브루클린 라거", price: 4500, options: []),
    .menu(name: "Brown Ale", desc: "상큼한 브라운 에일", price: 4500, options: []),
]))

app.run()
