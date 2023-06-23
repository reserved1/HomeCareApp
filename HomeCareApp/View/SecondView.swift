//import SwiftUI
//
//struct SecondView: View {
//
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    @Binding var roomList: [Room]
//
//    @State var selectedGroup: [Room] = []
//
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .center) {
//                HStack {
//                    Text("Selecione os Cômodos")
//                        .font(.custom("CyreneRegular", size: 32))
//                        .padding(.leading, 15)
//                        .padding(.top, 10)
//                    Spacer()
//                }
//                List {
//                    ForEach(roomList, id: \.id) { room in
//                        HStack {
//                            Image(room.image.imageName)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 35, height: 35)
//                                .padding(.trailing, 10)
//                            Button {
//                                if selectedGroup.contains(room) {
//                                    selectedGroup.removeAll(where: {$0 == room})
//                                } else {
//                                    selectedGroup.append(room)
//                                }
//                            } label: {
//                                Text("\(room.name)")
//                                    .font(.custom("Dosis-Medium", size: 18))
//                                    .foregroundColor(.black)
//                            }
//                            Spacer()
//                            Image(systemName: selectedGroup.contains(room) ? "checkmark" : "")
//                        }
//                    }
//                }
//                .listStyle(.plain)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                                .foregroundColor(.accentColor)
//                            Text("Trilha")
//                                .font(.custom("Dosis-Medium", fixedSize: 18))
//                                .foregroundColor(.accentColor)
//                        }
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        NewContentView(room: $roomList[0])
//                    } label: {
//                        Text("Editar")
//                            .font(.custom("Dosis-Medium", size: 18))
//                            .foregroundColor(.accentColor)
//                    }
//                }
//            }
//            .navigationBarBackButtonHidden(true)
//        }
//    }
//}
///*
// ArrayDeNome = [Cozinha,Sala,Quarto,Lavandeiras,Banheiro, Sala de musica]
// lista de inteiro = [2,0,5,3,2]
// count = 0
//for numero de elementos da lista de inteiros (cozinha) i ... 4(lista de inteiro.count)
// if listadeinteiro[i-1] > 0 {
//    for j ... listDeInteiro[i-1](2) {
//        Create// append(Room(UUID(), Array de Nome[count]
// }
// }
// */
