//
//  NewMessageViewController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 24/02/2022.
//

import UIKit

class NewMessageViewController: UIViewController {

    private static let nibName = "NewMessageViewController"
    
    static func getNewinstance() -> NewMessageViewController{
        let vc = NewMessageViewController(nibName: nibName, bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "New Message"
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
