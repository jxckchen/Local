//
//  HomeViewController.swift
//  Local
//
//  Created by Jack Chen on 12/17/18.
//  Copyright © 2018 Jack Chen. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController: UIViewController{

    @IBOutlet weak var barThing: UITabBarItem!
    
    let storageRef = Storage.storage().reference()
    let databaseRef = Database.database().reference()
    
    override func viewDidLoad() {
        barThing.title = nil
        barThing.imageInsets = UIEdgeInsets(top: 6,left:0,bottom: -6,right: 0)
        setBackgroundGrey()
        self.tabBarController?.tabBar.barTintColor = UIColor.black
    }
    
    
    @IBAction func logout(_ sender: Any) {
        let alertController = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        self.present(alertController, animated: true, completion: nil)
        let logoutAction = UIAlertAction(title: "Sign out", style: .default, handler: {(_: UIAlertAction!) in
            self.logoutFunction()
        })
        alertController.addAction(defaultAction)
        alertController.addAction(logoutAction)
    }
    
    func logoutFunction() {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
    
}
