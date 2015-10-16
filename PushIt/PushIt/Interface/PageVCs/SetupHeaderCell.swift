//
//  SetupHeaderCell.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class SetupHeaderCell: UICollectionViewCell {
    
    static let height:CGFloat = 112.0;

    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerLabel.textColor = UIColor.PushItGreenColor()
        headerLabel.font = UIFont.KnockoutHTF27JuniorBantamWithSize(42)
    }

}
