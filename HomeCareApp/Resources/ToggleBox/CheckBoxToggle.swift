import Foundation
import SwiftUI

struct CheckBoxToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(.blue)
                configuration.label
            }
        })
    }
}
