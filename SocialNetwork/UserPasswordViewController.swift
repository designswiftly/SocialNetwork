//
//  UserPasswordViewController.swift
//  SocialNetwork
//
//  Created by Pierluigi Cifani on 26/11/14.
//  Copyright (c) 2014 Pierluigi Cifani. All rights reserved.
//

import UIKit

class UserPasswordViewController: UIViewController {

    @IBAction func onDismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Añadir Blur
        let blurEffect = UIBlurEffect(style: .Light)
        let viewWithBlurredBackground = UIVisualEffectView(effect: blurEffect)
        viewWithBlurredBackground.frame = CGRectMake(0, 0, 320, 568)
        self.view.insertSubview(viewWithBlurredBackground, atIndex: 0)
    }

}
