// import SwiftUI
//
// struct PocContentView2: View {
//
//    @ObservedObject var roomList: GroupModel = GroupModel("Kitchen-Colored")
//
//    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
//
//    @State var selectedRooms: [Room] = []
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                ScrollView(.vertical) {
//                    LazyVGrid(columns: columns, alignment: .center, spacing: 80) {
//                        ForEach(roomList.rooms, id: \.self) { room in
//                            VStack {
//                                Text("Name Randomizer")
//                                GridRow(room: room, image: roomList.icon, rooms: $selectedRooms)
//                                Button("Button") {
//                                    print("Come on")
//                                }
//                            }
//                        }
//                    }
//                }
//                HStack {
//                    Button("Add Room For Test") {
//                        roomList.rooms.append(Room(
//                            id: UUID(),
//                            name: "Extra Room \(roomList.rooms.count)",
//                            tasks: [])
//                        )
//                    }
//                    #if os(tvOS)
//                        .padding(.leading, 225)
//                        .padding(.trailing, 1125)
//                    #endif
//                }
//            }
//        }
//    }
// }

//
//  CustomStepper.swift
//  HomeCare
//
//  Created by Luciana Adrião on 19/06/23.
//

// import SwiftUI
//
// struct CustomStepper: View {
//    @Binding var stepperValue: [Room]
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.continuous)
//            .stroke(style: StrokeStyle(lineWidth: 2.0, lineCap: .round, lineJoin: .round))
//            .foregroundColor(.accentColor)
//            .frame(width: 112, height: 31)
//            .overlay {
//                HStack(alignment: .center) {
//                    Button {
//                        // Minus Binding
//                        print("down")
//                        stepperValue.removeLast()
//
//                    } label: {
//                        Image(systemName: "minus")
//                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0)))
//                            .frame(width: 15, height: 15)
//                    }
//                    .disabled(stepperValue.count < 1)
//                    Spacer()
//
//                    Text(String(stepperValue.count))
//                        .foregroundColor(.accentColor)
//
//                    Spacer()
//                    Button {
//                        // Up Binding
//                        print("up")
//                        stepperValue.append(
//  Room(id: UUID(), name: "Comodo", tasks: [],
// icon: "Bathrooom-Colored", mini: "lavar"))
//                    } label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0)))
//                    }
//                }.padding(EdgeInsets(top: 9, leading: 10, bottom: 8, trailing: 10))
//            }
//    }
// }
