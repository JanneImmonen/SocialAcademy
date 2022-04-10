//
//  User.swift
//  SocialAcademy
//
//  Created by Janne Immonen on 23.3.2022.
//

import Foundation

struct User: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var imageURL: URL?
}

extension User {
    static let testUser = User(
        id: "",
        name: "Jeppe Salonius",
        imageURL: URL(string: "https://source.unsplash.com/lw9LrnpUmWw/480x480")
    )
}
