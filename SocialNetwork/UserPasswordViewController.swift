//
//  UserPasswordViewController.swift
//  SocialNetwork
//
//  Created by Pierluigi Cifani on 26/11/14.
//  Copyright (c) 2014 Pierluigi Cifani. All rights reserved.
//

import UIKit

class UserPasswordViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func onDismiss(sender: AnyObject) {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Preparar Botón
        loginButton.layer.cornerRadius = 15
        loginButton.clipsToBounds = true
        loginButton.titleLabel?.font = UIFont(name: "BAUER", size: 24.0)
        
        //Mostrar el teclado
        self.emailTextField.becomeFirstResponder()
    }
}
