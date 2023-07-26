protocol Option {
    var id: Int { get }
    var name: String { get }
    var desc: String { get }
    func info() -> String
}

extension Option {
    func info() -> String {
        return "\(id). \(name.padding(toLength: 30, withPad: " ", startingAt: 0)) | \(desc)"
    }
}
