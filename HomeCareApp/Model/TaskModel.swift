import Foundation

struct Task: Equatable, Hashable {
    let id: UUID = .init()
    var title: String
    var selfDescription: String
    var persons: [String]
    var isDone: Bool

    mutating func setPerson(_ person: String) {
        self.persons.append(person)
    }

    mutating func unsetPerson(_ person: String) {
        self.persons = persons.filter({ $0 != person })
    }

    mutating func setIsDone() {
        self.isDone = true
    }

    func getIsDone() -> Bool {
        isDone
    }

    static var emptyState: Task = .init(title: "", selfDescription: "", persons: [], isDone: false)
}

/*
 Model Mock
 Task(id: UUID(), titulo: "Primeiro", concluida: false),
 Task(id: UUID(), titulo: "Segundo", concluida: true),
 Task(id: UUID(), titulo: "Terceiro", concluida: false),
 Task(id: UUID(), titulo: "Quarto", concluida: false),
 Task(id: UUID(), titulo: "Quinto", concluida: true)
 */
