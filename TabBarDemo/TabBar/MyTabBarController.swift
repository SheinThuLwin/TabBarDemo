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
        setupTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTabBarItemSelectedStyle()
    }
    
    private func setupTabBar(){
        self.viewControllers = getTabViewControllers()
        
        tabBar.layer.shadowColor = UIColor.red.cgColor
        tabBar.layer.shadowOpacity = 0.8
        tabBar.layer.shadowOffset = CGSize(width: 2, height: 2)//CGSize.zero
        tabBar.layer.shadowRadius = 5
        
        self.tabBar.layer.borderColor = UIColor.yellow.cgColor
        self.tabBar.layer.borderWidth = 2
        
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = .white
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        self.tabBar.unselectedItemTintColor = .purple
        self.tabBar.tintColor = .orange
    }
    
    //This func will work correctly if you call from viewDidAppear.
    private func setupTabBarItemSelectedStyle(){
        let tabCount = CGFloat(tabBar.items?.count ?? 0)
        if tabCount > 0{
            let bottomSafeArea: CGFloat = self.view.safeAreaInsets.bottom
            let tabWidth = tabBar.frame.width/tabCount
            let tabHeight = tabBar.frame.height
            let selectionIndicatorImage = UIImage().createSelectionIndicator(color: .orange,
                                                                             size: CGSize(width: tabWidth, height: tabHeight),
                                                                             lineHeight: 3.0,
                                                                             bottomSafeArea: bottomSafeArea)

            self.tabBar.selectionIndicatorImage = selectionIndicatorImage
        }
    }
    
    private func getTabViewControllers() -> [UIViewController]{
        let homeVC = HomeViewController.getNewinstance()
        let messageVC = MessageViewController.getNewinstance()
        let bookmarkVC = BookMarkViewController.getNewinstance()
        let settingVC = SettingViewController.getNewinstance()
        let aboutVC = AboutViewController.getNewinstance()
        
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(named: "home")
        
        messageVC.tabBarItem.title = "Message"
        messageVC.tabBarItem.image = UIImage(named: "message")
        
        bookmarkVC.tabBarItem.title = "Bookmark"
        bookmarkVC.tabBarItem.image = UIImage(named: "bookmark")
        
        settingVC.tabBarItem.title = "Setting"
        settingVC.tabBarItem.image = UIImage(named: "setting")
        
        aboutVC.tabBarItem.title = "About"
        aboutVC.tabBarItem.image = UIImage(named: "about")
        
        return [homeVC, messageVC, bookmarkVC, settingVC, aboutVC]
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

extension UIImage {
    //Ref: https://nitishrajput912.medium.com/underline-tabbar-ios-swift-1ae53ac4a75f
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat, bottomSafeArea: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: size.height - bottomSafeArea, width: size.width, height: lineHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
