//
//  ODEAApp.swift
//  ODEA
//
//  Created by Student19 on 06/07/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


@main
struct ODEAILApp: App {
    
    init() {
        FirebaseApp.configure()
    }


    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
