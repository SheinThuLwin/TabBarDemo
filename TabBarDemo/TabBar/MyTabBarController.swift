//
//  MyTabBarController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 21/02/2022.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.tintColor = .orange
        
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let messageVC = MessageViewController(nibName: "MessageViewController", bundle: nil)
        
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(named: "home")
        
        messageVC.tabBarItem.title = "Message"
        messageVC.tabBarItem.image = UIImage(named: "message")
        
        self.viewControllers = [homeVC, messageVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
