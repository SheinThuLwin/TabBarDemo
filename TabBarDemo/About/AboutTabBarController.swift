//
//  AboutTabBarController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 22/02/2022.
//

import UIKit

class AboutTabBarController: UIViewController {
    private static let nibName = "AboutTabBarController"
    
    @IBOutlet weak var myTabBar: UITabBar!
    @IBOutlet weak var containerView: UIView!
    
    private var viewControllers: [UIViewController] = []
    private var tabBarItems: [UITabBarItem] = []
    private var selectedIndex = 0
    
    static func getNewInstance() -> AboutTabBarController{
        let vc = AboutTabBarController(nibName: nibName, bundle: nil)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabBar(tabBar: myTabBar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "About"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTabBarItemSelectedStyle(tabBar: myTabBar)
        setCurrentViewController(viewControllers: self.viewControllers, index: selectedIndex)
    }
    
    private func setupTabBar(tabBar: UITabBar){
        self.viewControllers = getTabViewControllers()
        selectedIndex = 1
        
        tabBar.clipsToBounds = false
        tabBar.backgroundColor = .white
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        tabBar.unselectedItemTintColor = .purple
        tabBar.tintColor = .red
        
        tabBarItems = []
        for vc in viewControllers {
            tabBarItems.append(vc.tabBarItem)
        }
        tabBar.items = tabBarItems
        tabBar.selectedItem = tabBarItems[selectedIndex]
        tabBar.delegate = self
    }
    
    //This func will work correctly if you call from viewDidAppear.
    private func setupTabBarItemSelectedStyle(tabBar: UITabBar){
        let tabCount = CGFloat(tabBar.items?.count ?? 0)
        if tabCount > 0{
            let tabWidth = tabBar.frame.width/tabCount
            let tabHeight = tabBar.frame.height
            let selectionIndicatorImage = UIImage().createSelectionIndicator(color: .red,
                                                                             size: CGSize(width: tabWidth, height: tabHeight),
                                                                             lineHeight: 3.0,
                                                                             bottomSafeArea: 0)

            tabBar.selectionIndicatorImage = selectionIndicatorImage
        }
    }
    
    private func getTabViewControllers() -> [UIViewController]{
        let shopVC = ShopsViewController.getNewInstance()
        let profileVC = MyProfileViewController.getNewInstance()
        
        setupTitleOnlyTabBarItem(tabBarItem: shopVC.tabBarItem, title: "Shops")
        setupTitleOnlyTabBarItem(tabBarItem: profileVC.tabBarItem, title: "My Profile")
        
        return [shopVC, profileVC]
    }
    
    private func setupTitleOnlyTabBarItem(tabBarItem: UITabBarItem, title: String){
        let txtVOffset: CGFloat = -12
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)]
        
        tabBarItem.title = title
        tabBarItem.image = nil
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: txtVOffset)
        tabBarItem.setTitleTextAttributes(systemFontAttributes, for: .normal)
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

extension AboutTabBarController: UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBarItems.firstIndex(of: item){
            if index != selectedIndex{
                print("Change VC at \(index)")
                changeViewController(viewControllers: self.viewControllers, newIndex: index)
            }
        }
        
    }
    
    private func setCurrentViewController(viewControllers: [UIViewController], index: Int){
        guard index >= 0, index < viewControllers.count else{
            return
        }
        
        let child = viewControllers[index]
        add(child: child, toView: containerView)
    }
    
    private func changeViewController(viewControllers: [UIViewController], newIndex: Int){
        guard newIndex >= 0, newIndex < viewControllers.count else{
            return
        }
        
        let oldChild = viewControllers[selectedIndex]
        let newChild = viewControllers[newIndex]
        
        remove(child: oldChild)
        selectedIndex = newIndex
        add(child: newChild, toView: containerView)
    }
    
    private func add(child: UIViewController, toView: UIView) {
        addChild(child)
        toView.addSubview(child.view)
        child.view.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
        child.didMove(toParent: self)
    }

    private func remove(child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
