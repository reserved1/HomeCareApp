//
//  TrailPath.swift
//  HomeCare
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct TrailPath: View {
    var rooms: [Room] = [
        .init(name: "a", image: RoomImage(state: .colored, image: .bathroom) , tasks: [])
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(rooms, id: \.self) { room in
                GridRow(room: room, image: Image(""), rooms: .constant([]))
                Text(room.name)
            }

        }
    }
}

struct TrailPath_Previews: PreviewProvider {
    static var previews: some View {
        TrailPath()
    }
}
