import SwiftUI

struct CustomStepper: View {

    @State var stepperCount: Int = 1
    var completionDecrease: () -> (Int)
    var completionIncrease: () -> (Int)

    init(initialStep: Int, completionDecrease: @escaping () -> Int, completionIncrease: @escaping () -> Int) {
        self.stepperCount = initialStep
        self.completionDecrease = completionDecrease
        self.completionIncrease = completionIncrease
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.continuous)
            .stroke(style: StrokeStyle(lineWidth: 2.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(.accentColor)
            .frame(width: 112, height: 31)
            .overlay {
                HStack(alignment: .center) {
                    Button {
                        // Minus Binding
                        stepperCount = completionDecrease()
                    } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.customBlue)
                            .frame(width: 15, height: 15)
                    }
                    .disabled(stepperCount < 1)
                    Spacer()

                    Text(String(stepperCount))
                        .foregroundColor(.accentColor)

                    Spacer()
                    Button {
                        // Up Binding
                        stepperCount = completionIncrease()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.customBlue)
                    }
                }.padding(EdgeInsets(top: 9, leading: 10, bottom: 8, trailing: 10))
            }
    }
}

struct DotSelected: View {
    var body: some View {

        GeometryReader { geometry in
            let screenSize = geometry.size
            ZStack {
                Circle()
                    .background(.clear)
                    .frame(width: screenSize.width/3, height: screenSize.height/3)
                    .cornerRadius(10)

                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: screenSize.width/7, height: screenSize.height/7)
            }
            .background(

                Circle()
            )
        }
    }
}

struct SelectImage: View {

    let gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Define o layout da grade

    @Binding  var selectedImage: RoomImage

    var body: some View {

        VStack(alignment: .center) {

            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach(RoomImage.allImages, id: \.id) { roomImage in

                    Image(roomImage.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(

                            DotSelected()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .opacity(
                                    roomImage.id == selectedImage.id ? 1 : 0
                                )
                        )
                        .onTapGesture {
                            if roomImage.id != selectedImage.id {
                                selectedImage = roomImage // Seleciona a imagem
                                selectedImage.state = .colored
                                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                    impactHeavy.impactOccurred()

                            }

                        }
                }
                .padding(16)
            }
        }
    }

}

class ViewModel: ObservableObject {
    @Published var rooms: [Room] = [.emptyState]
}


// TODO: Voltar valor para tela setRoomsView

struct AddRoom: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ViewModel = .init()
    @State var title: String = ""
    @State var image: RoomImage = .emptyState
    var addGroupCompletion: (GroupModel, Int) -> ()

    var body: some View {

        ScrollView {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.padding(.trailing, 20)
                    .padding(.top, 30)
            }

            VStack(alignment: .center, spacing: 14) {
                Text("Adicione um novo cômodo")
                Image(image.imageName)
                TextField("Nome do Cômodo", text: $title)
                    .padding([.leading, .trailing], 68)
                    .padding([.top, .bottom], 14)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)

                CustomStepper(initialStep: 1) {

                    let size =  self.viewModel.rooms.count

                    if size > 1 {
                        self.viewModel.rooms.removeLast()
                    }

                    return self.viewModel.rooms.count

                } completionIncrease: {
                    let first = self.viewModel.rooms[0]
                    self.viewModel.rooms.append(.init(name: first.name, image: first.image, tasks: []))
                    return self.viewModel.rooms.count
                }
            }.padding(.bottom, 71)

            VStack(alignment: .center, spacing: 35) {
                Text("Selecione um ícone para o cômodo")
                SelectImage(selectedImage: $viewModel.rooms[0].image)
            }
            Button("") {
                let group: GroupModel = .init(image, title)
                addGroupCompletion(group, self.viewModel.rooms.count)
               dismiss()
            }
            .buttonStyle(ActionButton(text: "Feito"))
            .padding([.leading, .trailing], 100)
        }
    }
}
