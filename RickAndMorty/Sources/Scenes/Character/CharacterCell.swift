//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

class CharacterCell: UITableViewCell, TableCell {
    // MARK: - Properties
    private let mainImageView = UIImageView()
    private let characterInfoStackView = UIStackView()
    private let nameLabel = Label(textStyle: .bodyBold)
    private let speciesLabel = Label(textStyle: .footnote)
    private let watchEpisodesButton = UIButton()
    private let locationLabel = Label(textStyle: .smallFootnote)
    private let statusLabel = Label(textStyle: .footnote)
    
    private var viewModel: CharacterCellViewModel?
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    func configure(with viewModel: TableCellViewModel) {
        guard let viewModel = viewModel as? CharacterCellViewModel else { return }
        self.viewModel = viewModel
        
        nameLabel.text = viewModel.name
        speciesLabel.text = viewModel.species
        statusLabel.text = viewModel.status.rawValue.uppercased()
        
        statusLabel.textColor = viewModel.statusColor
        statusLabel.backgroundColor = viewModel.statusColor.withAlphaComponent(0.1)
        
        configureImage(isAlive: viewModel.status.isAlive ?? true)
        
        statusLabel.snp.remakeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.top.equalTo(mainImageView.snp.top).inset(8)
            make.height.equalTo(24)
            make.width.equalTo(statusLabel.intrinsicContentSize.width + 12)
        }
        statusLabel.layoutIfNeeded()
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupMainImageView()
        setupStatusLabel()
        setupCharacterInfoStackView()
        setupNameLabel()
        setupWatchEpisodesButton()
        setupLocationLabel()
    }
    
    private func setupBackground() {
        selectionStyle = .none
    }
    
    private func setupMainImageView() {
        contentView.addSubview(mainImageView)
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 40
        mainImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.size.equalTo(120)
        }
    }
    
    private func setupStatusLabel() {
        contentView.addSubview(statusLabel)
        
        statusLabel.numberOfLines = 1
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 14, weight: .bold)
        statusLabel.layer.cornerRadius = 12
        statusLabel.clipsToBounds = true
        
        statusLabel.setContentHuggingPriority(.required, for: .horizontal)
        statusLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.top.equalTo(mainImageView.snp.top).inset(8)
            make.height.equalTo(24)
        }
    }
    
    private func setupCharacterInfoStackView() {
        contentView.addSubview(characterInfoStackView)
        characterInfoStackView.axis = .vertical
        characterInfoStackView.spacing = 12
        characterInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.top)
            make.leading.equalTo(mainImageView.snp.trailing).offset(12)
        }
    }
    
    private func setupNameLabel() {
        let stackView = UIStackView()
        characterInfoStackView.addArrangedSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 4
        
        nameLabel.numberOfLines = 1
        nameLabel.textColor = .baseBlack
        nameLabel.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(nameLabel)
        
        speciesLabel.numberOfLines = 1
        speciesLabel.textColor = .baseBlack
        stackView.addArrangedSubview(speciesLabel)
    }
    
    private func setupWatchEpisodesButton() {
        characterInfoStackView.addArrangedSubview(watchEpisodesButton)
        watchEpisodesButton.setTitle("▶ Watch episodes", for: .normal)
        watchEpisodesButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        watchEpisodesButton.setTitleColor(.orange, for: .normal)
        watchEpisodesButton.backgroundColor = UIColor.orange.withAlphaComponent(0.1)
        watchEpisodesButton.layer.cornerRadius = 16
        watchEpisodesButton.snp.makeConstraints { make in
            make.width.equalTo(140)
        }
    }
    
    private func setupLocationLabel() {
        let locationStackView = UIStackView()
        locationStackView.axis = .horizontal
        locationStackView.spacing = 4
        
        let locationIcon = UIImageView(image: R.image.locationImage())
        locationIcon.contentMode = .scaleAspectFit
        locationIcon.snp.makeConstraints { make in
            make.width.equalTo(8)
            make.height.equalTo(12)
        }
        
        locationLabel.text = "Earth (C-500A)"
        locationLabel.textColor = .darkGray
        locationStackView.addArrangedSubview(locationIcon)
        locationStackView.addArrangedSubview(locationLabel)
        characterInfoStackView.addArrangedSubview(locationStackView)
    }
    
    // MARK: - Private methods
    private func configureImage(isAlive: Bool) {
        if let imageData = viewModel?.imageData {
            let image = UIImage(data: imageData)
            self.mainImageView.image = isAlive ? image : image?.applyGrayscaleFilter()
        } else {
            viewModel?.getImage() { imageData in
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData)
                    self.mainImageView.image = isAlive ? image : image?.applyGrayscaleFilter()
                }
            }
        }
    }
}
