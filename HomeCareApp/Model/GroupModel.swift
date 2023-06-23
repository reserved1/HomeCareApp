import Foundation
import SwiftUI

class GroupModel: Hashable, ObservableObject, Identifiable {

    @Published var id: UUID
    @Published var rooms: [Room]
    @Published var image: RoomImage
    @Published var name: String

    init(_ image: RoomImage, _ name: String) {
        self.id = UUID()
        self.rooms = [
            Room(name: "\(name) 1", image: image, tasks: [
                .init(title: "Task 1", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 2", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 3", selfDescription: "", persons: [], isDone: false)
            ]),
            Room(name: "\(name) 2", image: image, tasks: [
                .init(title: "Task 1", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 2", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 3", selfDescription: "", persons: [], isDone: false)
            ]),
            Room(name: "\(name) 3", image: image, tasks: [
                .init(title: "Task 1", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 2", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 3", selfDescription: "", persons: [], isDone: false)
            ]),
            Room(name: "\(name) 4", image: image, tasks: [
                .init(title: "Task 1", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 2", selfDescription: "", persons: [], isDone: false),
                .init(title: "Task 3", selfDescription: "", persons: [], isDone: false)
            ])
        ]
        self.name = name
        self.image = image
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(rooms)
    }

    static func == (lhs: GroupModel, rhs: GroupModel) -> Bool {
        return lhs.id == rhs.id && lhs.rooms == rhs.rooms
    }
}
