//
//  CustomLayout.swift
//  CollectionSwiftBigHeaderDemo
//
//  Created by john on 16/5/11.
//  Copyright © 2016年 jhon. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let collectView = self.collectionView
        let offset = collectView?.contentOffset
        
        let attributes = super.layoutAttributesForElementsInRect(rect)
        
        if offset!.y < 0 {
            let delY = fabs((offset?.y)!)
            for layoutAttr in attributes! {
                let kind = layoutAttr.representedElementKind
                if kind == UICollectionElementKindSectionHeader {
                    let headerSize = self.headerReferenceSize
                    var rect = layoutAttr.frame
                    
                    rect.size.height = headerSize.height + delY
                    rect.size.width =  headerSize.width + delY
                    rect.origin.x = rect.origin.x - delY/2
                    rect.origin.y = rect.origin.y - delY
                    layoutAttr.frame = rect
                    break
                }
            }

        }
        return attributes;
    }
    
//    override func layoutAttributesForSupplementaryViewOfKind(elementKind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
//        let attribute = collectionView?.layoutAttributesForSupplementaryElementOfKind("kind", atIndexPath: indexPath)
//        
//        return attribute
//    }
    
}
