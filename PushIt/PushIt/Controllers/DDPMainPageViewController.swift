//
//  DDPMainPageViewController.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPMainPageViewController: UIPageViewController {
    
    var controllerNames: [UIViewController]?
    var pageIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.controllerNames = [self.storyboard!.instantiateViewControllerWithIdentifier("learnIt"), self.storyboard!.instantiateViewControllerWithIdentifier("doIt"), self.storyboard!.instantiateViewControllerWithIdentifier("trackIt")];
        self.setViewControllers([self.controllerNames!.first!]
            , direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: { (val) -> Void in
            
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if self.pageIndex > 0 {
            return getItemController(self.pageIndex - 1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as UIViewController
        
        if self.pageIndex+1 < controllerNames!.count {
            return getItemController(self.pageIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> UIViewController? {
        
        if itemIndex < controllerNames!.count {
            return self.controllerNames![itemIndex] as UIViewController
        }
        
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
