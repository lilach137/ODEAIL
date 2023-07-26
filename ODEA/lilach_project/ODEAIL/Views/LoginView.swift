//
//  LoginView.swift
//  ODEA
//
//  Created by Student19 on 15/07/2023.
//

import SwiftUI
struct LoginView: View {
  
    @State private var wrongEmail: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image(uiImage: #imageLiteral(resourceName: "Logo"))
                    Spacer()
                    VStack {
                        TextField("email", text: $loginViewModel.email)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongEmail))
                        
                        
                        SecureField("Password", text: $loginViewModel.password)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongPassword))
                        
                        if !loginViewModel.errorMessage.isEmpty {
                            Text(loginViewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                    }
                    Spacer()
                    PrimaryButton(
                        title: "Get Started",
                        background: .orange
                    ) {
                        loginViewModel.login()
                    }

                    Spacer()
                    HStack {
                        Text("Your first time? ")
                        NavigationLink("Sign up", destination : SignUpView())
                            .foregroundColor(Color.orange)
                    }
                }
                .padding()
            }
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
