//
//  LoginViewModel.swift
//  ODEA
//
//  Created by Student19 on 1/07/2023.
//
import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        

    }
    
    func validate()  -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill email and password"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Somthing wrong with your email"
            return false
        }
        
        return true
    }
}
