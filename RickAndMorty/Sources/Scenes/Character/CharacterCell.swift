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
    private let nameLabel = UILabel()
    private let speciesLabel = UILabel()
    private let watchEpisodesButton = UIButton()
    private let locationLabel = UILabel()
    private let statusLabel = UILabel()
    
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
            make.top.equalTo(mainImageView.snp.top)
            make.height.equalTo(24)
            make.width.equalTo(statusLabel.intrinsicContentSize.width + 12)
        }
        statusLabel.layoutIfNeeded()
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupMainImageView()
        setupCharacterInfoStackView()
        setupNameLabel()
        setupWatchEpisodesButton()
        setupLocationLabel()
        setupStatusLabel()
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
        statusLabel.layer.cornerRadius = 12
        statusLabel.clipsToBounds = true
        statusLabel.font = .systemFont(ofSize: 14)
        
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.top.equalTo(mainImageView.snp.top)
        }
    }
    
    private func setupCharacterInfoStackView() {
        contentView.addSubview(characterInfoStackView)
        characterInfoStackView.axis = .vertical
        characterInfoStackView.spacing = 10
        characterInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.top)
            make.leading.equalTo(mainImageView.snp.trailing).offset(12)
        }
    }
    
    private func setupNameLabel() {
        let stackView = UIStackView()
        characterInfoStackView.addArrangedSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 2
        
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .baseBlack
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.font = .systemFont(ofSize: 21, weight: .medium)
        stackView.addArrangedSubview(nameLabel)
        
        speciesLabel.numberOfLines = 1
        speciesLabel.textColor = .baseBlack
        speciesLabel.font = .systemFont(ofSize: 14)
        stackView.addArrangedSubview(speciesLabel)
    }
    
    private func setupWatchEpisodesButton() {
        characterInfoStackView.addArrangedSubview(watchEpisodesButton)
        watchEpisodesButton.setTitle("▶ Watch episodes", for: .normal)
        watchEpisodesButton.titleLabel?.font = .systemFont(ofSize: 14)
        watchEpisodesButton.setTitleColor(.orange, for: .normal)
        watchEpisodesButton.backgroundColor = UIColor.orange.withAlphaComponent(0.1)
        watchEpisodesButton.layer.cornerRadius = 16
        watchEpisodesButton.snp.makeConstraints { make in
            make.width.equalTo(148)
            make.height.equalTo(35)
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
        locationLabel.font = .systemFont(ofSize: 14)
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
