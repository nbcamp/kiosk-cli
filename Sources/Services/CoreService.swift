import Foundation

class CoreService {
    let viewer: Viewer
    let orderService: OrderService
    let waitService: WaitService

    init(
        viewer: Viewer,
        orderService: OrderService,
        waitService: WaitService
    ) {
        self.viewer = viewer
        self.orderService = orderService
        self.waitService = waitService
    }

    func execute(options: [Option]) {
//        _ = waitService.listen(sec: 5)

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
                ) else { sleep(3); continue }

                orderService.add(menu: menu)

            } else if case let .order(attr, menus) = option {
                guard let action = viewer.selectOrder(
                    title: attr.name,
                    options: menus,
                    receipt: orderService
                ) else { sleep(3); continue }

                if case let .action(attr) = action, attr.name == "Buy" {
                    _ = orderService.order(money: 999999)
                    viewer.printPaymentResult(success: true)
                    waitService.wait {}
                } else if case let .action(attr) = action, attr.name == "Clear" {
                    orderService.removeAll()
                }
            }
            sleep(2)
            waitService.notify()
            sleep(1)
        }
    }
}
