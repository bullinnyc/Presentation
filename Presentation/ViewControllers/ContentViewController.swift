//
//  ContentViewController.swift
//  Presentation
//
//  Created by Dmitry Kononchuk on 20.06.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var endPresentationButton: UIButton!
    
    // MARK: - Public Properties
    var currentIndex: Int!
    var backgroundColor: UIColor!
    var mainText: String!
    var subText: String!
    
    // MARK: - Private Properties
    private var pageNumber: Int {
        currentIndex + 1
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - IB Actions
    @IBAction func endPresentationPressed() {
        StorageManager.shared.saveKey()
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = backgroundColor
        
        endPresentationButton.isHidden = true
        endPresentationButton.setTitle("Close", for: .normal)
        
        if pageNumber == DataManager.shared.mainPresentationText.count {
            endPresentationButton.isHidden.toggle()
        }
        
        mainLabel.text = mainText
        subLabel.text = subText
    }
}
