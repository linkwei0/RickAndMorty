//
//  MenuViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import Foundation

protocol MenuViewModelDelegate: AnyObject {
    func viewModelDidRequestToShowNextScreen(_ viewModel: MenuViewModel, with type: MenuCellType)
}

class MenuViewModel {
    // MARK: - Properties
    weak var delegate: MenuViewModelDelegate?
    
    var onDidUpdateCollectionLayout: ((CollectionLayoutType) -> Void)?
    
    private var cellViewModels: [MenuCellViewModel] = []
    
    private(set) var collectionLayoutType = CollectionLayoutType.gallery
    
    private let menuCellsType: [MenuCellType] = [.episodes, .characters, .locations]
    
    // MARK: - Public methods
    func numberOfItemsInSection(_ section: Int) -> Int {
        return menuCellsType.count
    }
    
    func didChangeCollectionLayout(selectedIndex: Int) {
        let collectionLayout = CollectionLayoutType(rawValue: selectedIndex) ?? .gallery
        collectionLayoutType = collectionLayout
        onDidUpdateCollectionLayout?(collectionLayout)
    }
    
    func configureCellViewModel(at indexPath: IndexPath) -> MenuCellViewModel {
        let cellViewModel = MenuCellViewModel(type: menuCellsType[indexPath.row])
        cellViewModels.append(cellViewModel)
        return cellViewModel
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        delegate?.viewModelDidRequestToShowNextScreen(self, with: menuCellsType[indexPath.row])
    }
}
