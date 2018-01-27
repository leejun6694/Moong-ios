//
//  KeywordViewController.swift
//  ThinkMemo
//
//  Created by BLU on 2018. 1. 27..
//  Copyright © 2018년 Unithon. All rights reserved.
//

import UIKit

class KeywordViewController : UIViewController {
    
    @IBOutlet var keywordColvw: UICollectionView! {
        didSet {
            keywordColvw.delegate = self
            keywordColvw.dataSource = self
            keywordColvw.allowsMultipleSelection = true
        }
    }
    
    var selectedCells : NSMutableArray = []
    var keywords : [String] = []
    let reuseIdentifier = "KeywordCell"
    
//    var isCellSelected: Bool {
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension KeywordViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = keywordColvw.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! KeywordCell
        cell.layer.cornerRadius = 15
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 2
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.2
        
        if selectedCells.contains(indexPath) {
            cell.isSelected = true
        }
        else{
            cell.isSelected = false
        }
        
        return cell
    }
    
    // select, deselect cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("NO")
        selectedCells.add(indexPath)
        keywordColvw.reloadItems(at: [indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedCells.remove(indexPath)
        keywordColvw.reloadItems(at: [indexPath])
    }
    
}

extension KeywordViewController : UICollectionViewDelegate {
    
}

extension KeywordViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        guard collectionViewLayout is UICollectionViewFlowLayout else {
            return .zero
        }
        
        let cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
        
        if cellCount > 0 {
//            let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing
//
//            let totalCellWidth = cellWidth * cellCount
//            let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - flowLayout.headerReferenceSize.width - flowLayout.footerReferenceSize.width
//
//            if (totalCellWidth < contentWidth) {
//                let padding = (contentWidth - totalCellWidth + flowLayout.minimumInteritemSpacing) / 2.0
//                return UIEdgeInsetsMake(0, padding, 0, 0)
//            }
            
            return UIEdgeInsetsMake(0, 128.5, 0, 128.5)
        }
        
        return .zero
    }
}
