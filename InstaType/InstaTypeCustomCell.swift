//
//  InstaTypeCustomCell.swift
//  InstaType
//
//  Created by Марат Хасанов on 18.04.2024.
//

import UIKit

final class InstaTypeCustomCell: UITableViewCell {
        
    static let reuseIdentifier = "InstaCell"
    
    lazy var mainImage: UIImageView = {
       let image = UIImage(named: "0")
        let mainImage = UIImageView(image: image)
        mainImage.contentMode = .scaleToFill
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        return mainImage
    }()
    
    lazy var mainLikeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "No Active"), for: .normal)
        button.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .ypWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTapLike() {
        let isActive = mainLikeButton.currentImage == UIImage(named: "Active")
        let newImage = isActive ? UIImage(named: "No Active") : UIImage(named: "Active")
        mainLikeButton.setImage(newImage, for: .normal)

    }
    
    private func setupContraints() {
        
        contentView.addSubview(mainImage)
        contentView.addSubview(mainLabel)
        contentView.addSubview(mainLikeButton)
        
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImage.topAnchor.constraint(equalTo: margins.topAnchor),
            mainImage.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            mainLikeButton.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor),
            mainLikeButton.topAnchor.constraint(equalTo: mainImage.topAnchor),
            
            mainLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 8),
            mainLabel.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -8)
        ])
        mainImage.layer.cornerRadius = 16
        mainImage.layer.masksToBounds = true
    }
}
