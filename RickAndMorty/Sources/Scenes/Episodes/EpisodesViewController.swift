//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import UIKit

class EpisodesViewController: BaseViewController {
    // MARK: - Properties
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
    }
    
    // MARK: - Setup
    private func setup() {
        view.backgroundColor = .red
    }
}
