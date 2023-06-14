enum KnockKnock {
    enum Section: CaseIterable {
        case image
        case list
        case text
        case name
    }
    
    enum Item: Hashable {
        case image
        case list(ListType)
        case text
        case name
        
        enum ListType {
            case title, subTitle
            
            var placeHolder: String {
                switch self {
                case .title:        return "Type Title"
                case .subTitle:     return "Type Description"
                }
            }
        }
        
        var placeHolder: String {
            switch self {
            case .list(let type):   return type.placeHolder
            case .name:             return "Type Your Name"
            case .image, .text:     return ""
            }
        }
    }
}
