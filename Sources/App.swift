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
            viewer.printOptions(title: "SHAKESHACK", options: options)
            viewer.printReceipt(receipt: orderService)
            let category = viewer.selectCategory(categories: options)
            if case .exit = category { exit(0) }

            viewer.printMenus(title: category.name, menus: category.menus)
            guard let menu = viewer.selectMenu(menus: category.menus) else { continue }

            orderService.add(menu: menu)
        }
    }
}
