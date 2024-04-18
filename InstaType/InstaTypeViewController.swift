//
//  ViewController.swift
//  InstaType
//
//  Created by Марат Хасанов on 17.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let words = ["18 апреля 2024"]
    
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
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InstaTypeCustomCell.reuseIdentifier, 
                                                       for: indexPath) as? InstaTypeCustomCell else { return UITableViewCell() }
        cell.mainLabel.text = words[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
}

