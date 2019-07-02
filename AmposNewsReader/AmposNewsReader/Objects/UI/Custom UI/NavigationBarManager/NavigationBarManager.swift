//
//  NavigationBarManager.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class NavigationBarManager {
    
    
    static func changeNavigationBar(_ nc: UINavigationController) {
        nc.navigationBar.tintColor = .white
        
        if let color = UIColor(named: "GreenTitleColor") {
            nc.navigationBar.barTintColor = color
        }
        
        nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
