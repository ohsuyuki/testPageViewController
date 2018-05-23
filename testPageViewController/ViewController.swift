//
//  ViewController.swift
//  testPageViewController
//
//  Created by osu on 2018/05/23.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var viewControllers: [UIViewController] = []
    var pageViewController: UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        initViewControllers()
        initPageViewController()
    }

    private func initViewControllers() {
        viewControllers = [
            storyboard!.instantiateViewController(withIdentifier: "Page1"),
            storyboard!.instantiateViewController(withIdentifier: "Page2"),
        ]
    }
    
    private func initPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.setViewControllers([viewControllers[0]], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        view.addSubview(pageViewController.view)
    }

    // UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewControllers.index(of: viewController)
        if index == 0 {
            return nil
        }
        return viewControllers[index! - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = viewControllers.index(of: viewController)
        if index == viewControllers.count - 1 {
            return nil
        }
        
        return viewControllers[index! + 1]
    }

}

