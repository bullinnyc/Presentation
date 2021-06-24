//
//  StorageManager.swift
//  Presentation
//
//  Created by Dmitry Kononchuk on 21.06.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

import Foundation

class StorageManager {
    // MARK: - Public Properties
    static let shared = StorageManager()
    
    // MARK: - Private Properties
    private let userDefaults = UserDefaults.standard
    private let userDataKey = "presentationWasViewed"
    
    // MARK: - Private Initializers
    private init() {}
    
    // MARK: - Public Methods
    func saveKey() {
        userDefaults.set(true, forKey: userDataKey)
    }
    
    func fetchKey() -> Bool {
        userDefaults.bool(forKey: userDataKey)
    }
    
    func deleteKey() {
        userDefaults.removeObject(forKey: userDataKey)
    }
}
