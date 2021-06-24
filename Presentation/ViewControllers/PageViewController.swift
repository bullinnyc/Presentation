//
//  PageViewController.swift
//  Presentation
//
//  Created by Dmitry Kononchuk on 20.06.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    // MARK: - Private Properties
    private let contents = Content.getContent()
    private let backgroundColor = UIColor.systemTeal
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        view.backgroundColor = backgroundColor
        setContent(startingIndex: 0)
        setupPageControl()
    }
    
    // MARK: - Private Methods
    private func setContent(startingIndex: Int) {
        guard let contentVC = showViewControllerAtIndex(startingIndex) else { return }
        setViewControllers([contentVC], direction: .forward, animated: true)
    }
    
    private func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < contents.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentVC.mainText = contents[index].mainText
        contentVC.subText = contents[index].subText
        contentVC.currentIndex = index
        contentVC.backgroundColor = backgroundColor
        return contentVC
    }
    
    private func setupPageControl() {
        let pageControl = UIPageControl.appearance(
            whenContainedInInstancesOf: [PageViewController.self]
        )
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .gray
    }
}

// MARK: - Ext. UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentPageIndex = (viewController as! ContentViewController).currentIndex else { return nil }
        let pageNumber = currentPageIndex - 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentPageIndex = (viewController as! ContentViewController).currentIndex else { return nil }
        let pageNumber = currentPageIndex + 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contents.count - 1
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstVC = viewControllers?.first,
              let firstIndex = (firstVC as? ContentViewController)?.currentIndex else {
            return 0
        }
        return firstIndex
    }
}

// MARK: - Ext. UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let pendingIndex = (pendingViewControllers.first as! ContentViewController).currentIndex else { return }
        if pendingIndex == contents.count - 1 {
            StorageManager.shared.saveKey()
            dismiss(animated: true)
        }
    }
}
