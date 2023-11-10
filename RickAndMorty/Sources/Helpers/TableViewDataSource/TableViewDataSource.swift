//
//  TableViewDataSource.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var onDidScroll: ((_ scrollView: UIScrollView) -> Void)?
    
    private var tableView: UITableView?
    private var viewModel: TableViewModel?
    
    func setup(tableView: UITableView, viewModel: TableViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func update(with viewModel: TableViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sectionViewModels[section].cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel?.sectionViewModels[indexPath.section]
            .cellViewModels[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.tableReuseIdentifier, for: indexPath)
        (cell as? TableCell)?.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerViewModel = viewModel?.sectionViewModels[section].headerViewModel else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewModel.tableReuseIdentifier)
        (headerView as? TableHeaderView)?.configure(with: headerViewModel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel?.sectionViewModels[section].headerViewModel != nil {
            return UITableView.automaticDimension
        }
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onDidScroll?(scrollView)
    }
}
