class ViewModel {
    var sections: [KnockKnock.Section] = { KnockKnock.Section.allCases }()
    var items: [KnockKnock.Section: [KnockKnock.Item]] = {
        [
            .image: [.image],
            .list: [.list(.title), .list(.subTitle)],
            .text: [.text],
            .name: [.name]
        ]
    }()
}
