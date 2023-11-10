//
//  EpisodeHeaderView.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 09.11.2023.
//

import UIKit

class EpisodeHeaderView: UITableViewHeaderFooterView, TableHeaderView {
    // MARK: - Properties
    private let stackView = UIStackView()
    private let titleLabel = Label(textStyle: .header2)
    private let numberOfEpisodeLabel = Label(textStyle: .header2)
    private let dateLabel = Label(textStyle: .header2)
    private let separatorLine = UIView()
    
    // MARK: Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    func configure(with viewModel: TableHeaderViewModel) {
        guard let viewModel = viewModel as? EpisodeHeaderViewModel else { return }
        titleLabel.text = viewModel.title
        numberOfEpisodeLabel.text = viewModel.numberOfEpisode
        dateLabel.text = viewModel.dateTitle
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupStackView()
        setupTitleLabel()
        setupNumberOfEpisodeLabel()
        setupDateLabel()
        setupSeparatorLine()
    }
    
    private func setupBackground() {
        contentView.backgroundColor = .accentYellow
    }
    
    private func setupStackView() {
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .baseBlack
    }
    
    private func setupNumberOfEpisodeLabel() {
        stackView.addArrangedSubview(numberOfEpisodeLabel)
        numberOfEpisodeLabel.textAlignment = .center
        numberOfEpisodeLabel.textColor = .baseBlack
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
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
}
