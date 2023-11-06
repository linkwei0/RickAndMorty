//
//  MenuViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import UIKit

enum CollectionLayoutType: Int, CaseIterable {
    case gallery
    case list
    
    var layout: UICollectionViewFlowLayout {
        switch self {
        case .gallery:
            return MenuGalleryCollectionLayout()
        case .list:
            return MenuListCollectionLayout()
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .gallery:
            return UIImage(systemName: "square.on.square")
        case .list:
            return UIImage(systemName: "list.dash")
        }
    }
}

class MenuViewController: BaseViewController {
    // MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let collectionLayout = viewModel.collectionLayoutType.layout
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        return collectionView
    }()
    
    private let layoutTypeSegmentedControl = UISegmentedControl(items: CollectionLayoutType.allCases.map(\.iconImage))
    
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
        setupBindables()
    }
    
    override func viewDidLayoutSubviews() {
        layoutTypeSegmentedControl.applyGradient(colours: [.accentYellow, .accent])
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupCollectionView()
        setupLayoutTypeSegmentedControl()
    }
    
    private func setupBackground() {
        view.backgroundColor = .accent
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.reuseIdentifier)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupLayoutTypeSegmentedControl() {
        view.addSubview(layoutTypeSegmentedControl)
        layoutTypeSegmentedControl.addTarget(self, action: #selector(didChangeCollectionLayout(_:)), for: .valueChanged)
        layoutTypeSegmentedControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Actions
    @objc private func didChangeCollectionLayout(_ segmentedControl: UISegmentedControl) {
        viewModel.didChangeCollectionLayout(selectedIndex: segmentedControl.selectedSegmentIndex)
    }
    
    // MARK: - Binadles
    private func setupBindables() {
        viewModel.onDidUpdateCollectionLayout = { [weak self] collectionLayoutType in
            UIView.animate(withDuration: 0.7) {
                self?.collectionView.collectionViewLayout = collectionLayoutType.layout
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.reuseIdentifier,
                                                            for: indexPath) as? MenuCell else { return UICollectionViewCell() }
        cell.configure(with: viewModel.configureCellViewModel(at: indexPath))
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
}
