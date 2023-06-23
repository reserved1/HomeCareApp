//
//  CustomButtonsStyle.swift
//  HomeCare
//
//  Created by Luciana Adrião on 20/06/23.
//

import Foundation
import SwiftUI

struct ActionButton: ButtonStyle {
    var symbol: String?
    var text: String
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(configuration.isPressed ? Color.accentColor.opacity(0.8) : Color.accentColor)
                .overlay {
                    Text("\(text)")
                        .font(.headline)
                        .foregroundColor(.white)
                }
        }
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        .frame(height: 40)
    }
}

struct NewRoomButtonStyle: ButtonStyle {
    var imageNamed: String
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        ZStack(alignment: .bottom) {
                    Image(imageNamed)
                    Image("PlusButton")
                    .padding(EdgeInsets(top: 0, leading: 64, bottom: 0, trailing: 0))
        }
    }
}

struct PathRoomButtonStyle: ButtonStyle {
    var imageNamed: String
    var finishedTasks: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        ZStack(alignment: .centerLastTextBaseline) {
                    Image(imageNamed)
            if finishedTasks {
                Image("ConfirmButton-Medium").padding(EdgeInsets(top: -130, leading: 80, bottom: 0, trailing: 0))
            }
        }
    }
}

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {

        RoundedRectangle(cornerRadius: 10)
            .fill(configuration.isPressed ? Color.blue.opacity(0.8) : Color.blue)
            .overlay(
                configuration.label
                    .foregroundColor(.white)
                    .padding()
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .frame(height: 40)

    }
}

