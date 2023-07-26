//
//  DataManagerViewModel.swift
//  ODEA
//
//  Created by Student19 on 14/07/2023.
//
import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            exit(0)
        }catch{
            print(error)
        }
    }
}
