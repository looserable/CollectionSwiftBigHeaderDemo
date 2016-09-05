//
//  ViewController.swift
//  CollectionSwiftBigHeaderDemo
//
//  Created by john on 16/5/11.
//  Copyright © 2016年 jhon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    var collectView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let customLayout = CustomLayout()
        customLayout.itemSize = CGSizeMake(375, 40)
        customLayout.headerReferenceSize = CGSizeMake(375, 150)
        collectView = UICollectionView(frame: self.view.frame, collectionViewLayout: customLayout)
        collectView?.backgroundColor = UIColor.whiteColor()
        
        collectView?.alwaysBounceVertical = true;
        collectView?.showsVerticalScrollIndicator = false;
        collectView?.delegate = self
        collectView?.dataSource = self
        collectView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellID")
//        collectView?.registerNib(CustomCollectionReusableView., forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "headReuseview")
        let nib = UINib(nibName: "CustomCollectionReusableView", bundle: nil)
        collectView?.registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headReuseview")
        self.view.addSubview(collectView!)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellID", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.brownColor()
        let label = UILabel(frame: CGRectMake(10,10,200,20))
        label.text = ("\(indexPath.row)")
        label.backgroundColor = UIColor.purpleColor()
        label.textColor = UIColor.whiteColor()

        cell.contentView.addSubview(label)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let reuserView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headReuseview", forIndexPath: indexPath)

        return reuserView
    }
    
    

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

