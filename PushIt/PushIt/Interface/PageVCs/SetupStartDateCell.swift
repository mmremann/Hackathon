//
//  SetupStartDateCell.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class SetupStartDateCell: UICollectionViewCell {

    static let height:CGFloat = 99.0
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        
        let headerString = "START DATE"
        let headerAttributes = [NSKernAttributeName: 4.0, NSFontAttributeName:UIFont.KnockoutHTF30JuniorWelterWithSize(19.0), NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let attributedHeaderString = NSAttributedString(string: headerString, attributes: headerAttributes)
        
        self.headerLabel.attributedText = attributedHeaderString
        
        dateButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        dateButton.titleLabel?.font = UIFont.KnockoutHTF27JuniorBantamWithSize(26.0)
        dateButton.backgroundColor = UIColor.PushItDarkerBlurColor()
        dateButton.setTitle(NSDateFormatter.DDStringFromDate(NSDate(), forFormat: "EEEE, MMM. d yyyy")?.uppercaseString, forState: UIControlState.Normal)
        
    }

}
