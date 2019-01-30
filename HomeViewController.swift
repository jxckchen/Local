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
    
}
