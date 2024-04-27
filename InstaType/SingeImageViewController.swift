//
//  SingeImageViewController.swift
//  InstaType
//
//  Created by Марат Хасанов on 27.04.2024.
//

import UIKit

final class SingeImageViewController: UIViewController {
    
    lazy var mainImage: UIImageView = {
        let image = UIImage(named: "3")
        let mainImage = UIImageView(image: image)
        mainImage.contentMode = .scaleToFill
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        return mainImage
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left.circle"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLifecycle()
    }
    
    func setImage(image: UIImage?) {
        mainImage.image = image
    }
    @objc
    private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupLifecycle() {
        
        view.backgroundColor = .ypBlack
        view.addSubview(mainImage)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 9)])
    }
}
