import SwiftUI

struct SeventhView: View {

    @ObservedObject var groupListModel: GroupListModel = GroupListModel()

    @State var arrayListGroup: [Room] = []

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image("LivingRoom-Plain-Extra")
                    .scaleEffect(1.5)
                    .padding(.bottom, 50)
                Text("Ainda não existem cômodos na trilha.")
//                    .font(UIFont.)
                    .font(.custom("Dosis-Medium", size: 16))
                    .foregroundColor(.accentColor)
                Text("Adicione cômodos para fazer sua trilha de limpeza")
                    .font(.custom("Dosis-Medium", size: 16))
                    .foregroundColor(.accentColor)
            }
            .padding(.bottom, 200)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Trilha de Comodos")
                        .font(.custom("CyreneRegular", size: 32))
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        FourthView(roomList: $arrayListGroup)
                    } label: {
                        Text("Editar")
                            .font(.custom("Dosis-Medium", size: 18))
                            .foregroundColor(.accentColor)
                    }

                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            for group in groupListModel.groupLists {
                for room in group.rooms {
                    arrayListGroup.append(room)
                }
            }
        }
    }
}
