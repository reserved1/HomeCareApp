// import SwiftUI
//
// struct CustomStepper: View {
//
//    @Binding var stepperGroup: GroupModel
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
//                        stepperGroup.rooms.removeLast()
//                        print("Removed")
//
//                    } label: {
//                        Image(systemName: "minus")
//                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0)))
//                            .frame(width: 15, height: 15)
//                    }
//                    .disabled(stepperGroup.rooms.count < 1)
//                    Spacer()
//
//                    Text("\(stepperGroup.rooms.count)")
//
//                    Spacer()
//                    Button {
//                        // Up Binding
//                        stepperGroup.rooms.append(
//                            Room(id: UUID(),
//                                 name: "\(stepperGroup.name) \(stepperGroup.rooms.count)",
//                                 tasks: [],
//                                 icon: stepperGroup.icon,
//                                 mini: stepperGroup.miniIcon)
//                        )
//                        print("Added")
//                    } label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0)))
//                    }
//                }.padding(EdgeInsets(top: 9, leading: 10, bottom: 8, trailing: 10))
//            }
//    }
// }
