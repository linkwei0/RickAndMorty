//
//  MenuViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import Foundation

class MenuViewController: BaseViewController {
    // MARK: - Properties
    private let viewModel: MenuViewModel
    
    // MARK: - Init
    init(viewModel: MenuViewModel) {
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
        view.backgroundColor = .accent
    }
}
