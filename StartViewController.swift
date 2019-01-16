//
//  LoginViewController.swift
//  Local
//
//  Created by Jack Chen on 12/4/18.
//  Copyright © 2018 Jack Chen. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class StartViewController: UIViewController{
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCustomBackgroundImage()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
        }
    }
    
}
