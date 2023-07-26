//
//  PrimaryButton.swift
//  ODEA
//
//  Created by Student19 on 13/07/2023.
//

import SwiftUI


struct PrimaryButton: View {
    var title: String
    var background: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            // Action to perform when the button is tapped
            action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                    .frame(height: 50)
                    .padding(.vertical, 10) // Adjust the vertical padding to change the button height
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
    
    struct PrimaryButton_Previews: PreviewProvider {
        static var previews: some View {
            PrimaryButton(title: " ", background:.orange) {
                
            }
        }
    }
}
