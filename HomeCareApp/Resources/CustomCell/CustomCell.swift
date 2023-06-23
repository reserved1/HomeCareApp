import SwiftUI

struct CustomCell: View {
    var imageName: String = "Bedroom-Plain"

    var body: some View {
        VStack(spacing: -4) {
//            Text(name)
//                .foregroundColor(Color("DarkNeutral"))
//                .fontWeight(.semibold)
//                .font(.title3)
            Image(imageName)
        }
    }
}
