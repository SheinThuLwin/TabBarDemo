//
//  HomeViewController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 21/02/2022.
//

import UIKit

class HomeViewController: UIViewController {
    private static let nibName = "HomeViewController"
    
    static func getNewInstance() -> HomeViewController{
        let vc = HomeViewController(nibName: nibName, bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Home"
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
