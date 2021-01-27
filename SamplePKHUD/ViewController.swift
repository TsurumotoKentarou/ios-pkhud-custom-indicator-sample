//
//  ViewController.swift
//  SamplePKHUD
//
//  Created by 鶴本賢太朗 on 2021/01/27.
//

import UIKit
import PKHUD

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PKHUD.sharedHUD.contentView = CustomHUDView(frame: view.bounds)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
        PKHUD.sharedHUD.dimsBackground = false
        PKHUD.sharedHUD.show(onView: view)
    }
    
    @IBAction func didtapnavi(_ sender: Any) {
        if PKHUD.sharedHUD.isVisible {
            PKHUD.sharedHUD.hide(animated: false)
        }
        else {
            PKHUD.sharedHUD.show(onView: view)
        }
    }
}

class CustomHUDView: PKHUDWideBaseView, PKHUDAnimating {
    
    private let indicator: PKHUDSystemActivityIndicatorView

    override init(frame: CGRect) {
        indicator = PKHUDSystemActivityIndicatorView(frame: frame)
        super.init(frame: frame)
        indicator.frame.origin = CGPoint(x: self.bounds.width / 2 - indicator.bounds.width / 2, y: self.bounds.height / 2 - indicator.bounds.height / 2)
        self.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 1)
        self.addSubview(indicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startAnimation() {
        indicator.startAnimation()
    }
}
