import SwiftUI
import Foundation

struct AddTask: View {

    @Environment(\.dismiss) var dismiss

    @State var taskTitle: String = ""
    var addTaskCompletion: (Task) -> ()

    var body: some View {

        ScrollView {
            TextField("Tarefa", text: $taskTitle)
                .padding([.leading, .trailing], 68)
                .padding([.top, .bottom], 14)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)

            Button("Feito") {
               let task: Task = .init(title: taskTitle, selfDescription: "", persons: [], isDone: false)
               addTaskCompletion(task)
               dismiss()
            }
            .disabled(taskTitle.isEmpty)
            .buttonStyle(RoundedButtonStyle())
            .padding([.leading, .trailing], 100)
        }
    }
}
