//
//  RootVC.swift
//  MosaicFlowLayoutDemo
//
//  Created by Mostafa Abd ElFatah on 11/7/20.
//
//

import UIKit

final class RootVC: UIViewController {
    
    // MARK: - Public properties -
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Private properties -
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = TRMosaicLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

// MARK: - Extensions -
extension RootVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 102
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let red:CGFloat = 0//CGFloat.random(in: 0..<1)
        let green:CGFloat = 0 //CGFloat.random(in: 0..<1)
        let blue:CGFloat = 0//CGFloat.random(in: 0..<1)
        
        cell.contentView.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
        
        return cell
    }
    
}

extension RootVC :TRMosaicLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {
        //return indexPath.item % 9 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
         return 150
    }
}
