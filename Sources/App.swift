import Foundation

class App {
    let viewer: Viewer
    let orderService: OrderService
    var options: [Option] = []

    init(
        viewer: Viewer,
        orderService: OrderService
    ) {
        self.viewer = viewer
        self.orderService = orderService
    }

    func register(option: Option) {
        options.append(option)
    }

    func run() {
        while true {
            guard let option = viewer.selectCategory(
                title: "SHAKESHACK",
                options: options,
                receipt: orderService
            ) else { return }

            if case let .category(attr, menus) = option {
                guard let menu = viewer.selectMenu(
                    title: attr.name,
                    options: menus,
                    receipt: orderService
                ) else { continue }

                orderService.add(menu: menu)
            } else if case let .order(attr, menus) = option {
                guard let action = viewer.selectOrder(
                    title: attr.name,
                    options: menus,
                    receipt: orderService
                ) else { continue }

                if case let .action(attr) = action, attr.name == "Buy" {
                    _ = orderService.order(money: 999999)
                    viewer.printPaymentResult(success: true)
                } else if case let .action(attr) = action, attr.name == "Clear" {
                    orderService.removeAll()
                }
            }
        }
    }
}
