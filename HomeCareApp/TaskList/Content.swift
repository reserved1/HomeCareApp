import SwiftUI

struct Content: View {

    @Binding var room: Room

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack {
                    HStack {
                        Text("Tarefas")
                            .font(.custom("CyreneReguler", size: 32))
                            .foregroundColor(Color("DarkNeutral"))
                            .padding(.leading, 5)
                        Spacer()
                    }
                    .padding(.bottom, 25)
                    HStack {
                        Text(room.name)
                            .font(.custom("DosisSemiBold", size: 20))
                            .foregroundColor(Color("DarkNeutral"))
                            .padding(.leading, 15)
                        Spacer()
                        Button {
                            room.tasks.append(Task(
                                title: "Task \(room.tasks.count + 1)",
                                selfDescription: "",
                                persons: [],
                                isDone: false)
                            )
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Adicionar Tarefa")
                            }
                        }
                        .padding(.trailing, 10)
                    }
                }
                List {
                    ForEach(room.tasks, id: \.id) { task in
                        HStack {
                            Text(task.title)
                        }
                    }
                    .onDelete(perform: removeRow)
                }
                .listStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func removeRow(at offsets: IndexSet) {
        room.tasks.remove(atOffsets: offsets)
    }
}
