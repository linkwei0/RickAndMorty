//
//  MenuGalleryCollectionLayout.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import UIKit

class MenuGalleryCollectionLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        scrollDirection = .vertical
        minimumLineSpacing = 20
        minimumInteritemSpacing = 20
        sectionInset.top = 20
        sectionInset.left = 16
        sectionInset.right = 16
        
        let itemsInRow = 2
        let lineInset = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sectionInset.left * 2
        let collectionCellSize = (collectionView.frame.width - lineInset) / CGFloat(itemsInRow)
        itemSize = CGSize(width: collectionCellSize, height: collectionCellSize * 1.1)
    }
}
