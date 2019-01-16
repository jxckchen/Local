//
//  RoomListController.swift
//  Local
//
//  Created by Jack Chen on 1/16/19.
//  Copyright © 2019 Jack Chen. All rights reserved.
//

import Foundation
import UIKit

class RoomListController: UITabBarController {
    
    @IBOutlet weak var barThing: UITabBarItem!
    override func viewDidLoad() {
        barThing.title = nil
        barThing.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        setBackgroundGrey()
        self.tabBarController?.tabBar.barTintColor = UIColor.black
    }
}
