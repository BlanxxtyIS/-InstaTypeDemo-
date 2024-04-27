//
//  InstaTabBarController.swift
//  InstaType
//
//  Created by Марат Хасанов on 23.04.2024.
//

import UIKit

class InstaTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.barTintColor = .ypBlack
        tabBar.tintColor = .ypWhite //при выборе
        tabBar.unselectedItemTintColor = .ypGray
        
        let iTypeVc = InstaTypeViewController()
        let iTypeNavController = UINavigationController(rootViewController: iTypeVc)
        iTypeNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Main"), tag: 0)
        
        let iProfileVc = InstaProfileViewController()
        let iProfileNavController = UINavigationController(rootViewController: iProfileVc)
        
        iProfileNavController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Profile"), tag: 1)
        
        viewControllers = [iTypeNavController, iProfileNavController]
    }
}
