//
//  HomeViewController.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/15/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var pushItNowButton: UIButton!
    

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
        label2.textColor = UIColor.PushItGreenColor()
        
        pushItNowButton.backgroundColor = UIColor.PushItGreenColor()
        pushItNowButton.setTitleColor(UIColor.PushItDarkBlueColor(), forState: UIControlState.Normal)
        pushItNowButton.layer.cornerRadius = 2.0
        
    }

}
