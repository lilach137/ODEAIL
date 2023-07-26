//
//  SignInView.swift
//  ODEA
//
//  Created by Student19 on 11/07/2023.
//
import SwiftUI

struct SignUpView: View {
    @StateObject var signUpView = SighUpViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) { // Reduce the spacing between elements
                Spacer()
                
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .padding(.bottom, 50) // Reduce the bottom padding
                    
                    Spacer()
                    Spacer()
                    VStack{
                        TextField("Full Name", text: $signUpView.fullName)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                        TextField("Email", text: $signUpView.email)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                        SecureField("Password", text: $signUpView.password)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                    }
                    
                }
                Spacer()
                PrimaryButton(
                    title: "Let's Go",
                    background: .orange)
                {
                    signUpView.register()
                }.padding()
            }
            }
    }
}


struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
