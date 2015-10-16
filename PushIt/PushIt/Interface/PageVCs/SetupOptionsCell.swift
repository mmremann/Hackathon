//
//  SetupOptionsCell.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

enum setupCellType:Int {
    case Challenge
    case Difficulty
    
    static let all = [Challenge, Difficulty]
    static let headerStrings = ["Challenge type", "Difficulty"]
    
    static let challengeOptions = ["Push Ups", "Sit Ups", "Burpees"]
    static let difficultyOptions = ["Lazy", "Recommended", "Expert"]
    
    static let options = [challengeOptions, difficultyOptions]
}

class SetupOptionsCell: UICollectionViewCell {
    
    static let height:CGFloat = 116.0
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }
    
    private func setupUI() {
        
        for button in optionButtons {
            
            button.setTitleColor(UIColor.PushItDarkBlueColor(), forState: UIControlState.Selected)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont.KnockoutHTF27JuniorBantamWithSize(26.0)
            
            button.setBackgroundImage(UIImage.imageFromColor(UIColor.PushItDarkerBlurColor()), forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage.imageFromColor(UIColor.PushItGreenColor()), forState: UIControlState.Selected)
        }
        
    }
    
    var cellType:setupCellType = .Challenge {
        didSet {
            setHeaderStringForCellType(cellType)
            
            for button in optionButtons {
                let cellOptions = setupCellType.options[cellType.rawValue]
                let option = cellOptions[button.tag].uppercaseString
                
                button.setTitle(option, forState: UIControlState.Normal)
            }
        }
    }
    
    private func setHeaderStringForCellType(type:setupCellType) {
        let headerString = setupCellType.headerStrings[cellType.rawValue].uppercaseString
        let headerAttributes = [NSKernAttributeName: 4.0, NSFontAttributeName:UIFont.KnockoutHTF30JuniorWelterWithSize(19.0), NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let attributedHeaderString = NSAttributedString(string: headerString, attributes: headerAttributes)
        
        self.headerLabel.attributedText = attributedHeaderString
    }
  
  
}
