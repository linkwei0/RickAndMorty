//
//  TableViewDataSourceProtocols.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import Foundation

protocol TableCellViewModel {
    var tableReuseIdentifier: String { get }
    func select()
}

extension TableCellViewModel {
    func select() {}
}

protocol TableCell {
    func configure(with viewModel: TableCellViewModel)
}

protocol TableHeaderViewModel {
    var tableReuseIdentifier: String { get }
}

protocol TableHeaderView {
    func configure(with viewModel: TableHeaderViewModel)
}

protocol TableViewModel {
    var sectionViewModels: [TableSectionViewModel] { get }
}
