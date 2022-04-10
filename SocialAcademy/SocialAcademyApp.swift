//
//  SocialAcademyApp.swift
//  SocialAcademy
//
//  Created by Janne Immonen on 11.3.2022.
//

import SwiftUI
import Firebase

@main
struct SocialAcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
