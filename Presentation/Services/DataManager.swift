//
//  DataManager.swift
//  Presentation
//
//  Created by Dmitry Kononchuk on 20.06.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

class DataManager {
    // MARK: - Public Properties
    static let shared = DataManager()
    
    let mainPresentationText = [
        "Screen one",
        "Screen two",
        "Screen three",
        "Screen four"
    ]
    let subPresentationText = ["🍩", "🍭", "🍿", "🍔"]
    
    // MARK: - Private Initializers
    private init() {}
}
