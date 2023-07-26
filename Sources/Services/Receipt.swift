protocol Receipt {
    var total: Int { get }
    var items: [(option: Option, count: Int)] { get }
}
