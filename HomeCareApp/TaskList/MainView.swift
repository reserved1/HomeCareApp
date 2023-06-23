import SwiftUI

struct MainView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Binding var room: Room

    @State var isEditing: Bool = false

    var leadingButton: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.accentColor)
                    Text("Voltar")
                        .font(.custom("Dosis-Medium", fixedSize: 18))
                        .foregroundColor(.accentColor)
                }
            }
        }
    }

    var trailingButton: some View {
        HStack {
            Button {
                isEditing.toggle()
            } label: {
                    Text("Editar")
                        .font(.custom("Dosis-Medium", fixedSize: 18))
                        .foregroundColor(.accentColor)
            }
        }
    }

    var body: some View {
        NavigationStack {
            Content(room: $room)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                leadingButton
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                trailingButton
            }
        }
        .navigationBarBackButtonHidden(true)
//        NavigationStack {
//            VStack(alignment: .center) {
//                VStack {
//                    HStack {
//                        Text("Tarefas")
//                            .font(Font.custom("CyreneRegular", size: 38))
//                            .foregroundColor(Color("DarkNeutral"))
//                            .padding(.leading, 5)
//                        Spacer()
//                    }
//                    .padding(.bottom, 25)
//                    HStack {
//                        Text(room.name)
//                            .font(Font.custom("DosisSemiBold", size: 20))
//                            .foregroundColor(Color("DarkNeutral"))
//                            .padding(.leading, 15)
//                        Spacer()
//                        Button {
//                            room.tasks.append(Task(
//                                id: UUID(),
//                                title: "Task \(room.tasks.count + 1)",
//                                selfDescription: "",
//                                persons: [],
//                                isDone: false)
//                            )
//                        } label: {
//                            HStack {
//                                Image(systemName: "plus")
//                                Text("Adicionar Tarefa")
//                            }
//                        }
//
//                    }
//                }
//                List {
//                    ForEach(room.tasks, id: \.id) { task in
//                        HStack {
//                            Text(task.title)
//                            Spacer()
//                            Button {
//                                room.tasks.removeAll(where: {$0 == task})
//                            } label: {
//                                Image("Clear")
//                            }
//
//                        }
//                    }
//                }
//                .listStyle(.plain)
//            }
//            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    leadingButton
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    trailingButton
//                }
//            }
//            .padding()
//        }
    }
}
