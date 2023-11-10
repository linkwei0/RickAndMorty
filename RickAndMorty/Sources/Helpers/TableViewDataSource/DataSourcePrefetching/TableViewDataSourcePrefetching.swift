//
//  TableViewDataSourcePrefetching.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

protocol DataSourcePrefetching {
    var cellCount: Int { get }
    var needsPrefetch: Bool { get }
    var prefetchHandler: (() -> Void) { get }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool
    func prefetchIfNeeded(for indexPaths: [IndexPath])
}

extension DataSourcePrefetching {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= cellCount - 1
    }
    
    func prefetchIfNeeded(for indexPaths: [IndexPath]) {
        guard needsPrefetch else { return }
        if indexPaths.contains(where: isLoadingCell) {
            prefetchHandler()
        }
    }
}

class TableViewDataSourcePrefetching: NSObject, UITableViewDataSourcePrefetching, DataSourcePrefetching {
    let cellCount: Int
    let needsPrefetch: Bool
    let prefetchHandler: (() -> Void)
    
    init(cellCount: Int, needsPrefetch: Bool, prefetchHandler: @escaping () -> Void) {
        self.cellCount = cellCount
        self.needsPrefetch = needsPrefetch
        self.prefetchHandler = prefetchHandler
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        prefetchIfNeeded(for: indexPaths)
    }
}
