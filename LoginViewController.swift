//
//  LoginViewController.swift
//  Local
//
//  Created by Jack Chen on 12/17/18.
//  Copyright © 2018 Jack Chen. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCustomBackgroundImage()
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
    }
    
    
}
