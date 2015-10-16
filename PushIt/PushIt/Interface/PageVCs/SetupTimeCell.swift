//
//  SetupTimeCell.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class SetupTimeCell: UICollectionViewCell {
    
    static let height:CGFloat = 88.0

    @IBOutlet weak var endTimeButton: UIButton!
    @IBOutlet weak var startTimeButton: UIButton!
    @IBOutlet weak var endtimeLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        
        
        self.startTimeLabel.attributedText = getHeaderAttributedString("Daily start time")
        self.endtimeLabel.attributedText = getHeaderAttributedString("Daily end time")
        
        
        startTimeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        startTimeButton.titleLabel?.font = UIFont.KnockoutHTF27JuniorBantamWithSize(26.0)
        startTimeButton.backgroundColor = UIColor.PushItDarkerBlurColor()
        startTimeButton.setTitle("8:00 AM", forState: UIControlState.Normal)
        
        endTimeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        endTimeButton.titleLabel?.font = UIFont.KnockoutHTF27JuniorBantamWithSize(26.0)
        endTimeButton.backgroundColor = UIColor.PushItDarkerBlurColor()
        endTimeButton.setTitle("6:00 PM", forState: UIControlState.Normal)
    }
    
    private func getHeaderAttributedString(headerString:String) -> NSAttributedString {
        let headerAttributes = [NSKernAttributeName: 1.0, NSFontAttributeName:UIFont.KnockoutHTF30JuniorWelterWithSize(10), NSForegroundColorAttributeName: UIColor.whiteColor()]
    
        let attributedHeaderString = NSAttributedString(string: headerString.uppercaseString, attributes: headerAttributes)
        return attributedHeaderString
    }
    

}
