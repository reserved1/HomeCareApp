import SwiftUI

@main
struct HomeCareAppApp: App {
    var body: some Scene {
        WindowGroup {
            ThirdView(room: Room(name: "First Room" , image: RoomImage.emptyState, tasks: []))
        }
    }
}
