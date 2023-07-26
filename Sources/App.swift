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
            guard let option = viewer.selectMenu(
                title: "SHAKESHACK",
                options: options,
                receipt: orderService
            ) else { return }

            orderService.add(menu: option)
        }
    }
}
