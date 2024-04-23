//
//  ViewController.swift
//  InstaType
//
//  Created by Марат Хасанов on 17.04.2024.
//

import UIKit

 final class InstaTypeViewController: UIViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let words: [String] = Array(0...24).map {"\($0)"}
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InstaTypeCustomCell.self, forCellReuseIdentifier: InstaTypeCustomCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .ypBlack
        return tableView
    }()
    
    // MARK: - Init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLifecycle()
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    private func setupLifecycle() {
        
        view.addSubview(tableView)
        view.backgroundColor = .ypBlack
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}

// MARK: - UITableViewDataSource
extension InstaTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InstaTypeCustomCell.reuseIdentifier, 
                                                       for: indexPath) as? InstaTypeCustomCell else { return UITableViewCell() }
        cell.mainLabel.text = words[indexPath.row]
        cell.backgroundColor = .ypBlack
        cell.selectionStyle = .none
        if let image = UIImage(named: words[indexPath.row]) {
            cell.mainImage.image = UIImage(named: words[indexPath.row])
        }
        cell.mainLabel.text = dateFormatter.string(from: Date())
        let isLiked = indexPath.row % 2 == 0
        let likeImage = isLiked ? UIImage(named: "No Active") : UIImage(named: "Active")
        cell.mainLikeButton.setImage(likeImage, for: .normal)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension InstaTypeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: words[indexPath.row]) else {
            return 0
        }
        let imageInsets = UIEdgeInsets(top: 0, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InstaProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

