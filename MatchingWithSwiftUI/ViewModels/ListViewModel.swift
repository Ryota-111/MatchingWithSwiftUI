//
//  ListViewModel.swift
//  MatchingWithSwiftUI
//
//  Created by Ryota Fujitsuka on 2025/06/04.
//

import Foundation

class ListViewModel {
    var users = [User]()
    
    private var currentIndex = 0
    
    init() {
        self.users = getMockUsers()
    }
    
    private func getMockUsers() -> [User] {
        return [
            User.MOCK_USER1,
            User.MOCK_USER2,
            User.MOCK_USER3,
            User.MOCK_USER4,
            User.MOCK_USER5,
            User.MOCK_USER6,
            User.MOCK_USER7
        ]
    }
    
    func adjustIndex(isRedo: Bool) {
        if isRedo {
            currentIndex -= 1
        } else {
            currentIndex += 1
        }
    }
    
    func nopeButtonTapped() {
        if currentIndex >= users.count { return }
        
        NotificationCenter.default.post(name: Notification.Name("NOPEACTION"), object: nil, userInfo: ["id": users[currentIndex].id])
    }
    
    func likeButtonTapped() {
        if currentIndex >= users.count { return }
        
        NotificationCenter.default.post(name: Notification.Name("LIKEACTION"), object: nil, userInfo: ["id": users[currentIndex].id])
    }
    
    func redoButtonTapped() {
        if currentIndex <= 0 { return }
        
        NotificationCenter.default.post(name: Notification.Name("REDOACTION"), object: nil, userInfo: ["id": users[currentIndex - 1].id])
    }
    
    func tappedHandler(action: Action) {
        switch action {
            
        case .nope, .like:
            if currentIndex >= users.count { return }
        case .redo:
            if currentIndex <= 0 { return }
        }
    }
}
