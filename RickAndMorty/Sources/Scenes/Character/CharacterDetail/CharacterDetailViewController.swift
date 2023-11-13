//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 11.11.2023.
//

import UIKit

class CharacterDetailViewController: BaseViewController {
    // MARK: - Properties
    private let iconImageView = UIImageView()
    private let pageView = CharacterPageView()
    
    private let viewModel: CharacterDetailViewModel
    
    // MARK: - Init
    init(viewModel: CharacterDetailViewModel) {
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
        setupIconImageView()
        setupCharacterPageView()
    }
    
    private func setupIconImageView() {
        view.addSubview(iconImageView)
        iconImageView.image = R.image.defaultIconImage()
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.borderColor = UIColor.baseBlack.cgColor
        iconImageView.layer.borderWidth = 2.0
        iconImageView.layer.cornerRadius = 120
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(240)
        }
    }
    
    private func setupCharacterPageView() {
        view.addSubview(pageView)
        pageView.backgroundColor = .clear
        pageView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(320)
        }
    }
    
    // MARK: - Bindables
    private func setupBindables() {
        viewModel.onDidUpdate = { [weak self] characterPageViewModel, imageData in
            guard let strongSelf = self else { return }
            strongSelf.iconImageView.image = UIImage(data: imageData)
            strongSelf.pageView.configure(with: characterPageViewModel)
        }
    }
}
