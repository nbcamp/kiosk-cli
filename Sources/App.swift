import Foundation

class App {
    static let shared = App()

    func run(viewer: Viewer, options: [Option]) {
        while true {
            guard let option = viewer.selectMenu(
                title: "SHAKESHACK MENU",
                options: options
            ) else { return }

            print(option.info)
        }
    }

    private init() {}
}
