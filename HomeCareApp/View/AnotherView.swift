//import SwiftUI
//
//struct AnotherView: View {
//
//    @ObservedObject var groups: GroupListModel = GroupListModel() // objeto -> list
//
//    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
//
//    var body: some View {
//        NavigationStack {
//            ScrollView(.vertical) {
//                LazyVGrid(columns: columns) {
//                    ForEach(groups.groupLists, id: \.id) { group in
//                        VStack {
//                            Text(group.name)
//                                .foregroundColor(Color("DarkNeutral"))
//                                .fontWeight(.semibold)
//                                .font(.title3)
//                            Image(group.image.imageName)
//                            CustomStepperTwo(stepperCount: group.rooms.count) {
//                                let size = group.rooms.count
//
//                                if size > 1 {
//                                    group.rooms.removeLast()
//                                }
//
//                                return group.rooms.count
//                            } completionIncrease: {
//                                group.rooms.append(
//                                    .init(name: "\(group.name) \(group.rooms.count)",
//                                          image: group.image,
//                                          tasks: []))
//                                return group.rooms.count
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
