//
//  DetailsViewController+Functions.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension DetailsViewController {
    
    func setupUI() {
        self.title = "News"

        if let nc = navigationController {
            nc.navigationBar.topItem?.title = ""
            NavigationBarManager.changeNavigationBar(nc)
        }
    }
}
