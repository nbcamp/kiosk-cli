import Foundation

class App {
    var options: [Option] = []

    let core: CoreService

    init(core: CoreService) {
        self.core = core
    }

    func register(option: Option) {
        options.append(option)
    }

    func run() {
        core.execute(options: options)
    }
}
