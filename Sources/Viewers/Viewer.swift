protocol Viewer {
    func selectMenu(
        title: String,
        options: [Option],
        receipt: Receipt
    ) -> Option?
}
