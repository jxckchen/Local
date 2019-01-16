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
    
    override func viewDidLoad() {
        barThing.title = nil
        barThing.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
    }
    
    
}
