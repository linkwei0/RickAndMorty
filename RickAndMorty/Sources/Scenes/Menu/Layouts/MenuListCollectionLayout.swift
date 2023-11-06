//
//  MenuListCollectionLayout.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import UIKit

class MenuListCollectionLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        scrollDirection = .vertical
        minimumLineSpacing = 20
        sectionInset.top = 20
        
        let collectionCellWidth = collectionView.bounds.width * 0.9
        let collectionCellHeight = collectionView.bounds.height / 5        
        itemSize = CGSize(width: collectionCellWidth, height: collectionCellHeight)
    }
}
