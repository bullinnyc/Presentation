//
//  MainViewController.swift
//  Presentation
//
//  Created by Dmitry Kononchuk on 21.06.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Private properties
    private var presentationWasViewed: Bool {
        StorageManager.shared.fetchKey() ? true : false
    }
    
    // MARK: - Override Methods
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
        startPresentation()
    }
    
    // MARK: - Private Methods
    private func startPresentation() {
        if !presentationWasViewed {
            guard let pageVC = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController"
            ) as? PageViewController else { return }
            
            present(pageVC, animated: true)
        }
    }
    
    private func setupUI() {
        containerView.backgroundColor = .systemGray6
        containerView.isHidden = !presentationWasViewed
    }
}
