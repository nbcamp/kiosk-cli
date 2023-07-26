protocol Viewer {
    func printOptions(
        title: String,
        options: [Option]
    )

    func printMenus(
        title: String,
        menus: [Option]
    )

    func printReceipt(receipt: Receipt)

    func selectCategory(categories: [Option]) -> Option
    func selectMenu(menus: [Option]) -> Option?
}
