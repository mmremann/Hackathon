//
//  SetupCTACell.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class SetupCTACell: UICollectionViewCell {

    static let height:CGFloat = 60.0
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        button.backgroundColor = UIColor.PushItGreenColor()
        button.setTitleColor(UIColor.PushItDarkBlueColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.KnockoutHTF27JuniorBantamWithSize(37.5)
        button.layer.cornerRadius = 2.0

    }

}
