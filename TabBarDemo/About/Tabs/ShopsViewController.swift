//
//  ShopsViewController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 22/02/2022.
//

import UIKit

class ShopsViewController: UIViewController {
    private static let nibName = "ShopsViewController"
    
    static func getNewinstance() -> ShopsViewController{
        let vc = ShopsViewController(nibName: nibName, bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.tabBarController?.title = "Shops"
    }

    @IBAction func btnTouchUpInside(_ sender: UIButton) {
        print("Button press at shops.")
        let vc = ShopViewController.getNewinstance()
        self.parent?.navigationController?.pushViewController(vc, animated: true)
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
