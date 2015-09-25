//
//  DDCollectionViewUtility.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell(cellType:UICollectionViewCell.Type) {
        self.registerNib(cellType.nib(), forCellWithReuseIdentifier: cellType.id())
    }
    
    func registerSupplementaryView(classType:UICollectionReusableView.Type, kind:String) {
        self.registerNib(classType.nib(), forSupplementaryViewOfKind: kind, withReuseIdentifier: classType.id())
    }
    
    func dequeue<T where T:UICollectionViewCell>(cellType:T.Type, indexPath:NSIndexPath) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(cellType.id(), forIndexPath: indexPath) as! T
    }
    
    
    func dequeueSupplementary<T where T:UICollectionReusableView>(reusableType:T.Type, kind:String, indexPath:NSIndexPath) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reusableType.id(), forIndexPath: indexPath) as! T
    }
}

extension UICollectionReusableView {
    class func nib() -> UINib {
        var className = NSStringFromClass(self)
        
        if let range = className.rangeOfString(".") {
            className = className.substringFromIndex(range.endIndex)
        }
        
        return UINib(nibName: className, bundle: NSBundle.mainBundle())
    }
    
    class func id() -> String {
        var className = NSStringFromClass(self)
        
        if let range = className.rangeOfString(".") {
            className = className.substringFromIndex(range.endIndex)
        } else {
            print("Found a mangled class name? \(className)")
        }
        
        return className
    }
}