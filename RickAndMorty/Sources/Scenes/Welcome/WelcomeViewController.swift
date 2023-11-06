//
//  WelcomeViewController.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import UIKit

class WelcomeViewController: BaseViewController {
    // MARK: - Properties
    private let mainImageView = UIImageView()
    private let titleLabel = Label(textStyle: .header1)
    private let infoLabeL = Label(textStyle: .body)
    private let startButton = GradientButton(type: .system)
    private let stackView = UIStackView()
    
    private let viewModel: WelcomeViewModel
    
    // MARK: - Init
    init(viewModel: WelcomeViewModel) {
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
        setupBackground()
        setupStackView()
        setupMainImageView()
        setupTitleLabel()
        setupInfoLabel()
        setupStartButton()
    }
    private func setupBackground() {
        view.backgroundColor = .accent
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fill
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func setupMainImageView() {
        stackView.addArrangedSubview(mainImageView)
        mainImageView.image = R.image.rickAndMortyWelcomeImage()
        mainImageView.layer.masksToBounds = true
        mainImageView.layer.cornerRadius = 24
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.snp.makeConstraints { make in
            make.height.equalTo(350)
        }
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.text = R.string.welcome.welcomeLabelTitle()
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }
    
    private func setupInfoLabel() {
        stackView.addArrangedSubview(infoLabeL)
        infoLabeL.text = R.string.welcome.welcomeLabelInfo()
        infoLabeL.textAlignment = .center
        infoLabeL.numberOfLines = 0
    }
    
    private func setupStartButton() {
        stackView.addArrangedSubview(startButton)
        startButton.setTitle(R.string.welcome.welcomeButtonTitle(), for: .normal)
        startButton.setTitleColor(.baseBlack, for: .normal)
        startButton.titleLabel?.font = UIFont.bodyBold
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Actions
    @objc private func didTapStartButton() {
        viewModel.didTapStartButton()
    }
}
