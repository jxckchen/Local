//
//  SignupViewController.swift
//  Local
//
//  Created by Jack Chen on 12/17/18.
//  Copyright © 2018 Jack Chen. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class SignupViewController: UIViewController{
    
    //Outlets and variables
    let databaseRef = Database.database().reference()
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Visual attributes
        self.setCustomBackgroundImage()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.cornerRadius = 5
        confirmPasswordTextField.layer.borderColor = UIColor.white.cgColor
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "confirm password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        if passwordTextField.text != confirmPasswordTextField.text {
            //Alert if your password is wrong
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
                if error == nil {
                    //Change username
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    if self.usernameTextField.text != "" {
                        changeRequest?.displayName = self.usernameTextField.text
                        changeRequest?.commitChanges { error in
                            if error == nil {
                                print("Username changed")
                            }
                        }
                    }
                    self.performSegue(withIdentifier: "signupToHome", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
        }
    }
    

}
    
    

