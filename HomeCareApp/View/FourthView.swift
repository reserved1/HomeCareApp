import SwiftUI

struct FourthView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    @Binding var roomList: [Room]

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack {
                    Text("Adicione tarefas aos cômodos")
                        .font(.custom("Dosis-Medium", size: 22))
                        .padding(.leading, 15)
                        .padding(.top, 10)
                        .foregroundColor(Color("DarkNeutral"))
                    Text("(Você pode continuar mais tarde)")
                        .font(.custom("Dosis-Medium", size: 16))
                        .foregroundColor(Color("DarkNeutral"))
                }
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns) {
                        ForEach($roomList, id: \.id) { $room in
                            NavigationLink {
                                ThirdView(room: room)
                            } label: {
                                VStack {
                                    Text(room.name)
                                        .foregroundColor(Color("DarkNeutral"))
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                    Image(room.image.imageName)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.accentColor)
                            Text("Trilha")
                                .font(.custom("Dosis-Medium", fixedSize: 18))
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
/*
 ArrayDeNome = [Cozinha,Sala,Quarto,Lavandeiras,Banheiro, Sala de musica]
 lista de inteiro = [2,0,5,3,2]
 count = 0
for numero de elementos da lista de inteiros (cozinha) i ... 4(lista de inteiro.count)
 if listadeinteiro[i-1] > 0 {
    for j ... listDeInteiro[i-1](2) {
        Create// append(Room(UUID(), Array de Nome[count]
 }
 }
 */
