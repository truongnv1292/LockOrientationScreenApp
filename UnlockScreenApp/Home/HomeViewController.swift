//
//  HomeViewController.swift
//  UnlockOrientationScreenApp
//
//  Created by Nguyen Truong on 2/3/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnOpenLockScreen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionOpenLockScreen(_ sender: Any) {
        navigationController?.pushViewController(LockOrientationViewController(nibName: "LockOrientationViewController", bundle: nil), animated: true)
    }
    
}
