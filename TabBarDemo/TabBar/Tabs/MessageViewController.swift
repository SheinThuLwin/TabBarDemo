//
//  MessageViewController.swift
//  TabBarDemo
//
//  Created by ut-i02 on 21/02/2022.
//

import UIKit

class MessageViewController: UIViewController {
    private static let nibName = "MessageViewController"
    
    static func getNewinstance() -> MessageViewController{
        let vc = MessageViewController(nibName: nibName, bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
