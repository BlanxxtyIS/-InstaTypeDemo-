//
//  InstaProfileViewController.swift
//  InstaType
//
//  Created by Марат Хасанов on 22.04.2024.
//

import UIKit

final class InstaProfileViewController: UIViewController {
    // MARK: - Public Propeties
    
    // MARK: - Private Properties
    private lazy var profileImage: UIImageView = {
        let image = UIImage(named: "MockPhoto")
        let imageView = UIImageView(image: image)
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var exitProfileButton: UIButton = {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.setImage(UIImage(named: "Exit"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "Хасанов Марат"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .ypWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileLogin: UILabel = {
        let label = UILabel()
        label.text = "@Blanxxty"
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .ypGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileText: UILabel = {
        let label = UILabel()
        label.text = "Hi, take me to work please"
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .ypWhite
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialized
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        setupUI()
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    @objc
    private func exitButtonClicked() {
        print("Выйти - выйти")
    }
    
    private func setupUI() {
        view.addSubview(profileInfoStack)
        view.addSubview(exitProfileButton)
        view.addSubview(profileImage)
        profileInfoStack.addArrangedSubview(profileName)
        profileInfoStack.addArrangedSubview(profileLogin)
        profileInfoStack.addArrangedSubview(profileText)
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            profileInfoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileInfoStack.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            profileInfoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
            exitProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            exitProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 43)
        ])
    }
              
}
