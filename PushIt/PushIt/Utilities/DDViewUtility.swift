//
//  DDViewUtility.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func constraintForAttribute(attribute:NSLayoutAttribute) -> NSLayoutConstraint? {
        for constraint in self.constraints {
            if constraint.firstAttribute == attribute {
                return constraint
            }
        }
        
        return nil
    }
    
    func constraintWithView(view:UIView, attribute:NSLayoutAttribute) -> NSLayoutConstraint? {
        for constraint in self.constraints {
            //Guard for the constraints concerning the views we care about
            guard let secondItem = constraint.secondItem as? UIView else { continue }
            guard secondItem == view || constraint.firstItem as! UIView == view else { continue }
            
            if (constraint.firstAttribute == attribute && constraint.firstItem as! UIView == view) {
                return constraint
            } else if (secondItem == view && constraint.secondAttribute == attribute) {
                return constraint
            }
        }
        
        if let cell = self as? UICollectionViewCell {
            return cell.contentView.constraintWithView(view, attribute: attribute)
        }
        
        print("Unable to find constraint for attribute: \(attribute)")
        return nil
    }


    public class func instantiateFromNib<T: UIView>(viewType: T.Type) -> T {
        let url = NSURL(string: NSStringFromClass(viewType))
        return NSBundle.mainBundle().loadNibNamed(url?.pathExtension, owner: nil, options: nil).first as! T
    }

    public class func instantiateFromNib() -> Self {
        return instantiateFromNib(self)
    }
}
