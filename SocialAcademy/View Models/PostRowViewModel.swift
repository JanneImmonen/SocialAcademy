//
//  PostRowViewModel.swift
//  SocialAcademy
//
//  Created by Janne Immonen on 23.3.2022.
//

import Foundation

@MainActor
@dynamicMemberLookup
class PostRowViewModel: ObservableObject, StateManager {
    typealias Action = () async throws -> Void
    
    @Published var post: Post
    @Published var error: Error?
    
    var canDeletePost: Bool { deleteAction != nil }
    
    subscript<T>(dynamicMember keyPath: KeyPath<Post, T>) -> T {
        post[keyPath: keyPath]
    }
    
    private let deleteAction: Action?
    private let favoriteAction: Action
    
    init(post: Post, deleteAction: Action?, favoriteAction: @escaping Action) {
        self.post = post
        self.deleteAction = deleteAction
        self.favoriteAction = favoriteAction
    }
    
    func deletePost() {
        guard let deleteAction = deleteAction else {
            preconditionFailure("Cannot delete post: no delete action provided")
        }
        withStateManagingTask(perform: deleteAction)
    }
    
    func favoritePost() {
        withStateManagingTask(perform: favoriteAction)
    }
}
