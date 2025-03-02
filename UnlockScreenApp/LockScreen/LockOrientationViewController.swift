//
//  LockOrientationViewController.swift
//  UnlockOrientationScreenApp
//
//  Created by Nguyen Truong on 2/3/25.
//

import UIKit

class LockOrientationViewController: UIViewController {
    
    @IBOutlet weak var btnLockOrientation: UIButton!
    
    var currentOrientation: UIInterfaceOrientation = .portrait
    var isLockOrientation: Bool = false {
        didSet {
            updateRotateScreenSetting()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateRotateScreenSetting()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            appdelegate.orientationSetting = .all
        }
    }
    
    func updateRotateScreenSetting() {
        btnLockOrientation.setTitle(isLockOrientation ? "Unlock Orientation": "Lock Orientation", for: .normal)
        currentOrientation = getCurrentDeviceOrientation()
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            appdelegate.orientationSetting = isLockOrientation ? getTypeOrientation(orientation: currentOrientation): .all
        }
        UIDevice.current.setValue(currentOrientation.rawValue, forKey: "orientation")
        //UIViewController.attemptRotationToDeviceOrientation()
        setNeedsUpdateOfSupportedInterfaceOrientations()
    }
    
    
    /// 🛠 Lấy hướng màn hình chính xác trên iOS mới
    func getCurrentDeviceOrientation() -> UIInterfaceOrientation {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return scene.interfaceOrientation
        }
        return .unknown
    }
    
    func getTypeOrientation(orientation: UIInterfaceOrientation) -> UIInterfaceOrientationMask {
        switch orientation {
        case .portrait: return .portrait
        case .portraitUpsideDown: return .portraitUpsideDown
        case .landscapeLeft: return .landscapeLeft
        case .landscapeRight: return .landscapeRight
        default: return .portrait
        }
    }
    
    
    @IBAction func actionLockOrientation(_ sender: Any) {
        isLockOrientation.toggle()
    }
}
