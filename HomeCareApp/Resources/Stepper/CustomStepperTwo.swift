import SwiftUI

struct CustomStepperTwo: View {

   // @Binding var stepperValue: [Room]

    @State var stepperCount: Int

    var completionDecrease: () -> (Int)
    var completionIncrease: () -> (Int)

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
                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0)))
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
                            .foregroundColor(Color(CGColor(red: 0.02, green: 0.45, blue: 0.74, alpha: 1.0)))
                    }
                }.padding(EdgeInsets(top: 9, leading: 10, bottom: 8, trailing: 10))
            }
    }
}
