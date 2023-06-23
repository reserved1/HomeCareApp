import SwiftUI

struct NewContentView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Binding var room: Room

    var backButton: some View {
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

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack {
                    HStack {
                        Text("Tarefas")
                            .font(.custom("CyreneRegular", size: 38))
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

                    }
                }
                List {
                    ForEach(room.tasks, id: \.id) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Button {
                                room.tasks.removeAll(where: {$0 == task})
                            } label: {
                                Image("clear")
                            }

                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
            }
            .padding()
        }
    }
}
