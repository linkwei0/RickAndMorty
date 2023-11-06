//
//  MenuCell.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 06.11.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {
    // MARK: - Properties
    private let mainImageView = UIImageView()
    private let titleLabel = Label(textStyle: .bodyBold)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    func configure(with viewModel: MenuCellViewModel) {
        mainImageView.image = viewModel.iconImage
        titleLabel.text = viewModel.title
    }
    
    // MARK: - Setup
    private func setup() {
        setupMainImageView()
        setupTitleLabel()
    }
    
    private func setupMainImageView() {
        contentView.addSubview(mainImageView)
        mainImageView.layer.cornerRadius = 24
        mainImageView.layer.borderWidth = 1.0
        mainImageView.layer.borderColor = UIColor.baseBlack.cgColor
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        mainImageView.addSubview(titleLabel)
        titleLabel.textColor = .accentYellow
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
        }
    }
}
