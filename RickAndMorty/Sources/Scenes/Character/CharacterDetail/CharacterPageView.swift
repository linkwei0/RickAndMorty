//
//  CharacterPageView.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 12.11.2023.
//

import UIKit

class CharacterPageView: UIView {
    // MARK: - Properties
    private let containerView = UIView()
    private let stackView = UIStackView()
    private let buttonsStackView = UIStackView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.applyGradient(colours: [.accentYellow, .accent])
        containerView.backgroundColor = .green
        buttonsStackView.applyGradient(colours: [.accentYellow, .accent])
        containerView.layer.cornerRadius = 24
        buttonsStackView.layer.cornerRadius = 24
    }
    
    // MARK: - Configure
    func configure(with viewModel: CharacterPageViewModel) {
        viewModel.pageItemTypes.forEach { configureHorizontalStack($0) }
    }
    
    // MARK: - Setup
    private func setup() {
        setupContainerView()
        setupStackView()
        setupLocationButtons()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
    }
    
    private func setupStackView() {
        containerView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    private func setupLocationButtons() {
        addSubview(buttonsStackView)
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 4
        buttonsStackView.distribution = .equalCentering
        
        let originButton = UIButton()
        originButton.setTitle(R.string.characterPage.characterPageViewButtonOrigin(), for: .normal)
        originButton.setTitleColor(.baseBlack, for: .normal)
        originButton.titleLabel?.font = UIFont.bodyBold
        originButton.addTarget(self, action: #selector(didTapOriginButton), for: .touchUpInside)
        originButton.snp.makeConstraints { make in
            make.width.equalTo(165)
        }
        
        let separator = UIView()
        separator.backgroundColor = .baseBlack
        separator.snp.makeConstraints { make in
            make.width.equalTo(1.0)
        }
        
        let locationButton = UIButton()
        locationButton.setTitle(R.string.characterPage.characterPageViewButtonLoction(), for: .normal)
        locationButton.setTitleColor(.baseBlack, for: .normal)
        locationButton.titleLabel?.font = UIFont.bodyBold
        locationButton.addTarget(self, action: #selector(didTapLocationButton), for: .touchUpInside)
        locationButton.snp.makeConstraints { make in
            make.width.equalTo(165)
        }
        
        [originButton, separator, locationButton].forEach { buttonsStackView.addArrangedSubview($0) }
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
    }
    
    private func configureHorizontalStack(_ type: CharacterPageItemType) {
        let titleLabel = Label(textStyle: .body)
        titleLabel.text = type.titleText
        titleLabel.textColor = .baseBlack
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.bodyBold
        
        let infoLabel = Label(textStyle: .body)
        infoLabel.text = type.infoText
        infoLabel.textColor = type.textColor
        infoLabel.textAlignment = .center
        
        let hStackView = UIStackView()
        stackView.addArrangedSubview(hStackView)
        hStackView.axis = .horizontal
        hStackView.spacing = 20
        hStackView.distribution = .equalSpacing
        
        [titleLabel, infoLabel].forEach { hStackView.addArrangedSubview($0) }
    }
    
    // MARK: - Actions
    @objc private func didTapOriginButton() {
        print("Show origin screen")
    }
    
    @objc private func didTapLocationButton() {
        print("Show location screen")
    }
}
