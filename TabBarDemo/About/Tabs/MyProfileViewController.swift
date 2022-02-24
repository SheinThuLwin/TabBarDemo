//
//  MyProfileViewController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 22/02/2022.
//

import UIKit

class MyProfileViewController: UIViewController {
    private static let nibName = "MyProfileViewController"
    
    static func getNewinstance() -> MyProfileViewController{
        let vc = MyProfileViewController(nibName: nibName, bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.tabBarController?.title = "My Profile"
    }

    @IBAction func btnTouchUpInside(_ sender: UIButton) {
        print("Button press at Profile.")
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
