//
//  SignUpViewModel.swift
//  ODEA
//
//  Created by Student19 on 13/07/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class SighUpViewModel: ObservableObject {
    @Published var email: String = "" // by default it's empty
    @Published var fullName = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUser(id: userId)
        }
    }
    
    private func insertUser(id: String) {
        let newUser = User(id: id, name: fullName, email: email)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 8 else {
            return false
        }
        
        return true
    }
}
