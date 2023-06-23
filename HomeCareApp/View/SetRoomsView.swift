import SwiftUI

struct SetRoomsView: View {

    @ObservedObject var groups: GroupListModel = GroupListModel() // objeto -> list

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State var moveToTaskView = false
    @State private var showingSheet: Bool = false
    @State var array: [Int] = []

    var body: some View {
        NavigationStack {
            Text("Selecione todos os cômodos da sua casa")
                .foregroundColor(.darkNeutral)
                .fontWeight(.semibold)
                .font(.custom("Dosis-Medium", size: 20))

            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(groups.groupLists, id: \.id) { group in
                        VStack {
                            Text(group.name)
                                .foregroundColor(.darkNeutral)
                                .fontWeight(.semibold)
                                .font(.title3)
                            Image(group.image.imageName)
                            CustomStepperTwo(stepperCount: group.rooms.count) {
                                let size = group.rooms.count

                                if size > 1 {
                                    group.rooms.removeLast()
                                }

                                return group.rooms.count
                            } completionIncrease: {
                                group.rooms.append(
                                    Room(name: "\(group.name) \(group.rooms.count)", image: group.image, tasks: [])
                                )
                                return group.rooms.count
                            }
                        }
                    }

                    Button("") {
                        showingSheet.toggle()
                    }
                    .buttonStyle(NewRoomButtonStyle(imageNamed: "house-colored"))
                    .sheet(isPresented: $showingSheet) {
                        AddRoom { group, count in
                            groups.groupLists.append(group)
                            array.append(count)
                        }
                    }
                }
            }
            // TODO: Integrar navegação para tela de adicionar tarefas (Tela 5)
            /// Pode mudar para NavigationLink ou manter como Button, vai da sua facilidade.
            Button("") {
                print("Move to another View")
            }
            .buttonStyle(ActionButton(text: "Avançar"))
            .frame(minWidth: 163, idealWidth: 163, maxWidth: 170, idealHeight: 50, maxHeight: 60)

        }.onAppear {
            for group in groups.groupLists {
                array.append(group.rooms.count)
            }
        }
    }
}
