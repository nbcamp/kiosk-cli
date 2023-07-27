import Foundation

class WaitService {
    private let queue: DispatchQueue
    private let viewer: Viewer

    private var count = 0
    private var timer: DispatchSourceTimer?

    init(
        viewer: Viewer,
        queue: DispatchQueue
    ) {
        self.viewer = viewer
        self.queue = queue
    }

    func wait(end: @escaping () -> Void) {
        queue.async {
            self.count += 1
            sleep(UInt32.random(in: 10 ... 30))
            self.count -= 1
            end()
        }
    }

    func listen(sec: Int) -> (() -> Void) {
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer?.schedule(deadline: .now(), repeating: .seconds(sec))
        timer?.setEventHandler { [weak self] in
            guard let self = self else { return }
            self.viewer.printWaitingCount(count: self.count)
        }

        resume()

        return {
            self.timer?.cancel()
            self.timer = nil
        }
    }

    func notify() {
        viewer.printWaitingCount(count: count)
    }

    func pause() {
        timer?.suspend()
    }

    func resume() {
        timer?.resume()
    }
}
