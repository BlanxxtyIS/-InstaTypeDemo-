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
        
        let iTypeVc = InstaTypeViewController()
        iTypeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: ""), tag: 0)
        
        let iProfileVc = InstaProfileViewController()
        iProfileVc.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: ""), tag: 1)
        
        viewControllers = [iTypeVc, iProfileVc]
    }
}
