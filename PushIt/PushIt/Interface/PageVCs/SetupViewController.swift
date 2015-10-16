//
//  SetupViewController.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    static let id = "SetupViewController"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.PushItDarkBlueColor()
        
        self.collectionView.registerCell(SetupHeaderCell)
        self.collectionView.registerCell(SetupOptionsCell)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - CollectionView DataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row
        
        if row == 0 {
            let headerCell = collectionView.dequeue(SetupHeaderCell.self, indexPath: indexPath)
            return headerCell
        } else { //if row == 1 || row == 2 {
            let optionsCell = collectionView.dequeue(SetupOptionsCell.self, indexPath: indexPath)
            optionsCell.cellType = setupCellType.all[row - 1]
            return optionsCell
        }
    }
    
    //MARK: CollectionView Delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    
    //MARK: CollectionViewLayout Delegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        var cellHeight:CGFloat = 0.0
        
        if indexPath.row == 0 {
            cellHeight = SetupHeaderCell.height
        } else {
            cellHeight = SetupOptionsCell.height
        }
        return CGSizeMake(width, cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }


}
