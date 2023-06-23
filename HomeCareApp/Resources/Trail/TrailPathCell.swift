//
//  TrailPathCell.swift
//  HomeCare
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct TrailPathCell: View {
    var iconName: String = "LivingRoom-Colored"
    var roomName: String = "Kitchen"

    var body: some View {
        ZStack(alignment: .bottom) {

            Button("") {
                // Circle Image

            }.buttonStyle(PathRoomButtonStyle(imageNamed: "LivingRoom-Colored", finishedTasks: false))

            Button {
                //
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 1.5))
                    .overlay(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10).fill(Color.lightNeutral)
                            .overlay(alignment: .center) {
                                Text("Kitchen")
                            }
                    }

            }
            .frame(width: 128, height: 24).padding(EdgeInsets(top: 0, leading: 0, bottom: -4, trailing: 0))
        }
    }
}

struct TrailPathCell_Previews: PreviewProvider {
    static var previews: some View {
        TrailPathCell()
    }
}
