import Foundation
import SwiftUI

struct GridRow: View {

    let room: Room

    let image: Image

    @Binding var rooms: [Room]

    var body: some View {
        Button(action: {
            if rooms.contains(room) {
                rooms.removeAll { $0 == room }
                print("Removed \(room.name)")
            } else {
                rooms.append(room)
                print("Added \(room.name)")
            }
        }, label: {
            Image(rooms.contains(room) ? "Kitchen-Colored" : "Kitchen-Plain")
//            Text(room.name)
//                .tag(room)
//                .foregroundColor(rooms.contains(room) ? .blue : .red)
        })
        #if os(tvOS)
            .frame(width: 300, height: 300)
        #else
            .frame(width: 130, height: 130)
        #endif
//        .background(rooms.contains(room) ? Color.red : Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
