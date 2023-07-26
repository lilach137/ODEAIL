//
//  PopUpView.swift
//  ODEA
//
import Combine
import SwiftUI
import UIKit

struct PopupView: View {
    let title: String
    let message: String
    let buttonText: String
    let action: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text(message)
                .multilineTextAlignment(.center)
                .padding()
            Button(action: action) {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
