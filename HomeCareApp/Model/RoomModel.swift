import Foundation

extension RoomImage {

    enum State: String, CaseIterable {
        case colored = "colored"
        case plain = "plain"
        case mini = "mini"
        case def = ""

        static var allStates: [State] {
            return [.colored, .plain, .mini]
        }
    }

    enum ImageIcon: String, CaseIterable {
        case bathroom = "bathroom"
        case bedroom = "bedroom"
        case closet = "closet"
        case kitchen = "kitchen"
        case livingroom = "livingroom"
        case office = "office"
        case def = ""

        static var allRoomImages: [ImageIcon] {
            return [.bathroom, .bedroom, .closet, .kitchen, .livingroom, .office]
        }
    }
}

struct RoomImage: Hashable {

    let id: UUID
    var state: State
    var image: ImageIcon

    init(state: State, image: ImageIcon) {
        self.id = .init()
        self.state = state
        self.image = image
    }

    var imageName: String {
        return "\(image)-\(state)"
    }

    static var allImages: [RoomImage] = ImageIcon.allRoomImages.reduce([RoomImage](), { arrayOfImage, image in
        return arrayOfImage + [.init(state: .plain, image: image)]
    })
    static var emptyState = RoomImage(state: .plain, image: .livingroom)
}

class Room: Equatable, ObservableObject, Hashable {

    static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.id == rhs.id
    }

    let id: UUID
    @Published var name: String
    @Published var image: RoomImage
    @Published var tasks: [Task]

    init(name: String, image: RoomImage, tasks: [Task]) {
        self.id = .init()
        self.name = name
        self.image = image
        self.tasks = tasks
    }

    static var emptyState = Room(name: "", image: .emptyState, tasks: [])

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(image)
        hasher.combine(tasks)
    }
}
