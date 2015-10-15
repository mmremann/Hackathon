//
//  HomeViewController.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/15/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private methods
    
    private func setupUI()  {
        
        view.backgroundColor = UIColor.PushItDarkBlueColor()
        
    }

}
