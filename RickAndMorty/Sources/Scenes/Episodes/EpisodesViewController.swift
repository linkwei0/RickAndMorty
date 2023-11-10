//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import UIKit

class EpisodesViewController: BaseViewController {
    // MARK: - Properties
    private var dataSource = TableViewDataSource()
    
    private let tableView = UITableView()
    
    private var prefetchDataSource: TableViewDataSourcePrefetching?
    
    private let viewModel: EpisodesViewModel
    
    // MARK: - Init
    init(viewModel: EpisodesViewModel) {
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
        viewModel.viewIsReady()
        setupBindables()
    }
    
    // MARK: - Setup
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .accentYellow
        tableView.rowHeight = 60
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = .baseBlack
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.reuseIdentifier)
        tableView.register(EpisodeHeaderView.self, forHeaderFooterViewReuseIdentifier: EpisodeHeaderView.reuseIdentifier)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let test = TableViewDataSourcePrefetching(cellCount: viewModel.episodes.count,
                                                  needsPrefetch: viewModel.needsPrefetch) { [weak self] in
            self?.viewModel.viewIsReady()
        }
        dataSource.setup(tableView: tableView, viewModel: viewModel)
    }
    
    // MARK: - Private methods
    private func reloadTableView() {
        prefetchDataSource = TableViewDataSourcePrefetching(cellCount: viewModel.episodes.count,
                                                            needsPrefetch: viewModel.needsPrefetch) { [weak self] in
            self?.viewModel.viewIsReady()
        }
        tableView.prefetchDataSource = prefetchDataSource
        tableView.reloadData()
    }
    
    // MARK: - Bindables
    private func setupBindables() {
        viewModel.viewState.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.reloadTableView()
            }
        }
    }
}
