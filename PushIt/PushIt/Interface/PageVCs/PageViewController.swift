//
//  PageViewController.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var controllers = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let stats = UIStoryboard(name: "Pages", bundle: nil).instantiateViewControllerWithIdentifier(StatsViewController.id)
        let setup = UIStoryboard(name: "Pages", bundle: nil).instantiateViewControllerWithIdentifier(SetupViewController.id)
        
        controllers = [setup, stats]

        self.dataSource = self
        
        self.setViewControllers([setup], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.view.backgroundColor = UIColor.PushItDarkBlueColor()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController is SetupViewController {
            return controllers[1] as? UIViewController
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController is StatsViewController {
            return controllers[0] as? UIViewController
        } else {
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
