//
//  HomeViewController.swift
//  Local
//
//  Created by Jack Chen on 12/17/18.
//  Copyright © 2018 Jack Chen. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UITabBarController{
    
    @IBOutlet weak var barThing: UITabBarItem!
    @IBOutlet weak var profileImage: UIImageView!
    let anyImage:UIImage = UIImage(named: "icons8-customer-30")!
    
    override func viewDidLoad() {
        barThing.title = nil
        barThing.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        setBackgroundGrey()
        self.tabBarController?.tabBar.barTintColor = UIColor.black
//        profileImage.maskCircle(anyImage: anyImage.self)
    }
    
    
}
