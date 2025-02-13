//
//  EpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

class EpisodeDetailViewController: BaseViewController {
    // MARK: - Properties
    private var dataSoure = TableViewDataSource()
    
    private var prefetchDataSource: TableViewDataSourcePrefetching?

    private let tableView = UITableView()
    
    private let viewModel: EpisodeDetailViewModel
    
    // MARK: - Init
    init(viewModel: EpisodeDetailViewModel) {
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
        tableView.rowHeight = 140
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .baseBlack
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.reuseIdentifier)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        dataSoure.setup(tableView: tableView, viewModel: viewModel)
    }
    
    // MARK: - Private methods
    private func reloadTableView() {
        prefetchDataSource = TableViewDataSourcePrefetching(cellCount: viewModel.characters.count,
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
