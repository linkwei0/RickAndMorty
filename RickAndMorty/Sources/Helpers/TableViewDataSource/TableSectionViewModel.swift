//
//  TableSectionViewModel.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

class TableSectionViewModel {
    let headerViewModel: TableHeaderViewModel?
    
    private(set) var cellViewModels: [TableCellViewModel] = []
    
    init(headerViewModel: TableHeaderViewModel? = nil) {
        self.headerViewModel = headerViewModel
    }
    
    func append(_ cellViewModel: TableCellViewModel) {
        cellViewModels.append(cellViewModel)
    }
    
    func append(cellViewModels: [TableCellViewModel]) {
        self.cellViewModels.append(contentsOf: cellViewModels)
    }
    
    func remove(at index: Int) {
        cellViewModels.remove(at: index)
    }
}
