//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 10.11.2023.
//

import UIKit

class CharacterCell: UITableViewCell, TableCell {
    // MARK: - Properties
    private let stackView = UIStackView()
    private let mainImageView = UIImageView()
    private let nameLabel = Label(textStyle: .bodyBold)
    private let statusLabel = Label(textStyle: .footnoteBold)
    
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
        mainImageView.image = viewModel.image
        nameLabel.text = viewModel.name
        statusLabel.text = viewModel.status
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupStackView()
        setupMainImageView()
        setupNameLabel()
        setupStatusLabel()
    }
    
    private func setupBackground() {
        selectionStyle = .none
    }
    
    private func setupStackView() {
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupMainImageView() {
        stackView.addArrangedSubview(mainImageView)
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.image = UIImage(systemName: "person")
    }
    
    private func setupNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        nameLabel.text = "Rick Sanches"
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .baseBlack
    }
    
    private func setupStatusLabel() {
        stackView.addArrangedSubview(statusLabel)
        statusLabel.text = "Жив"
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0
        statusLabel.textColor = .baseBlack
    }
}
