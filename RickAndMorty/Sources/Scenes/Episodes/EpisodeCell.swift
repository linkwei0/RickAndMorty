//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import UIKit

class EpisodeCell: UITableViewCell, TableCell {
    // MARK: - Properties
    private let stackView = UIStackView()
    private let nameLabel = Label(textStyle: .body)
    private let episodeLabel = Label(textStyle: .body)
    private let dateLabel = Label(textStyle: .footnoteBold)
    private let separatorLine = UIView()
    
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
        guard let viewModel = viewModel as? EpisodeCellViewModel else { return }
        nameLabel.text = viewModel.episodeName
        episodeLabel.text = viewModel.episodeNumber
        dateLabel.text = viewModel.episodeDate
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupStackView()
        setupNameLabel()
        setupEpisodeLabel()
        setupDateLabel()
        setupSeparatorLine()
    }
    
    private func setupBackground() {
        selectionStyle = .none
        backgroundColor = .accent
    }
    
    private func setupStackView() {
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupNameLabel() {
        stackView.addArrangedSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .baseBlack
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = false
        nameLabel.lineBreakMode = .byTruncatingTail
    }
    
    private func setupEpisodeLabel() {
        stackView.addArrangedSubview(episodeLabel)
        episodeLabel.textAlignment = .center
        episodeLabel.textColor = .baseBlack
    }
    
    private func setupDateLabel() {
        stackView.addArrangedSubview(dateLabel)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .baseBlack
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
