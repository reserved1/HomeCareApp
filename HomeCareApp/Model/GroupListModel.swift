import Foundation
import SwiftUI

class GroupListModel: Hashable, ObservableObject, Identifiable {

    @Published var id: UUID
    @Published var groupLists: [GroupModel]

    init() {
        self.id = UUID()
        self.groupLists = [
            GroupModel(.init(state: .plain, image: .kitchen), "Cozinha"),
            GroupModel(.init(state: .plain, image: .livingroom), "Sala"),
            GroupModel(.init(state: .plain, image: .bedroom), "Quarto")
        ]
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(groupLists)
    }

    static func == (lhs: GroupListModel, rhs: GroupListModel) -> Bool {
        return lhs.id == rhs.id && lhs.groupLists == rhs.groupLists
    }

    func addGroup(_ img: RoomImage, _ name: String ) {
        groupLists.append(GroupModel(img, name))
    }
}
