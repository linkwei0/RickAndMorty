//
//  LocationListViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import UIKit

class LocationListViewController: BaseViewController {
    // MARK: - Properties
    private var prefetchDataSource: TableViewDataSourcePrefetching?
    
    private let dataSource = TableViewDataSource()
    private let tableView = UITableView()
    
    private let viewModel: LocationListViewModel
    
    // MARK: - Init
    init(viewModel: LocationListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupBindables()
        viewModel.viewIsReady()
    }
    
    // MARK: - Setup
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 80
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.reuseIdentifier)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        dataSource.setup(tableView: tableView, viewModel: viewModel)
    }
    
    // MARK: - Private methods
    private func reloadTableView(with state: SimpleViewState<LocationModel>) {
        prefetchDataSource = TableViewDataSourcePrefetching(cellCount: viewModel.locations.count,
                                                            needsPrefetch: viewModel.needsPrefetch) { [weak self] in
            self?.viewModel.viewIsReady()
        }
        tableView.prefetchDataSource = prefetchDataSource
        tableView.reloadData()
    }
    
    // MARK: - Bindables
    private func setupBindables() {
        viewModel.viewState.bind { [weak self] state in
            DispatchQueue.main.async {
                self?.reloadTableView(with: state)
            }
        }
    }
}
