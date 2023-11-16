//
//  LocationCell.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 16.11.2023.
//

import UIKit

class LocationCell: UITableViewCell, TableCell {
    // MARK: - Properties
    private let stackView = UIStackView()
    private let nameLabel = Label(textStyle: .bodyBold)
    private let dimesionLabel = Label(textStyle: .body)
    private let residentsCountLabel = Label(textStyle: .footnoteBold)
    private let separatorLine = UIView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    func configure(with viewModel: TableCellViewModel) {
        guard let viewModel = viewModel as? LocationCellViewModel else { return }
        nameLabel.text = "Имя: \(viewModel.name)"
        dimesionLabel.text = "Измерение: \(viewModel.dimension)"
        residentsCountLabel.text = "Персонажи: \(viewModel.residentsCount)"
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupStackView()
        setupNameLabel()
        setupDimensionLabel()
        setupResidentsCountLabel()
        setupSeparatorLine()
    }
    
    private func setupBackground() {
        selectionStyle = .none
        backgroundColor = .baseWhite
    }
    
    private func setupStackView() {
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        nameLabel.textColor = .baseBlack
    }
    
    private func setupDimensionLabel() {
        stackView.addArrangedSubview(dimesionLabel)
        dimesionLabel.textColor = .baseBlack
    }
    
    private func setupResidentsCountLabel() {
        contentView.addSubview(residentsCountLabel)
        residentsCountLabel.textColor = .baseBlack
        residentsCountLabel.textAlignment = .right
        residentsCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupSeparatorLine() {
        contentView.addSubview(separatorLine)
        separatorLine.backgroundColor = .baseBlack
        separatorLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
}
