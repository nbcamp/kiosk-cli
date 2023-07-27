protocol Viewer {
    func selectCategory(title: String, options: [Option], receipt: Receipt) -> Option?
    func selectMenu(title: String, options: [Option], receipt: Receipt) -> Option?
    func selectOrder(title: String, options: [Option], receipt: Receipt) -> Option?

    func printPaymentResult(success: Bool)
    func printWaitingCount(count: Int)
}
