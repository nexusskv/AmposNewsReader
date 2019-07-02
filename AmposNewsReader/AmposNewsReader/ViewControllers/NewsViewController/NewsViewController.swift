//
//  NewsViewController.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class NewsViewController: UIViewController {
    @IBOutlet weak var dataTable: UITableView!
    @IBOutlet weak var searhBar: UISearchBar!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    var dataArray: [NewsObject]     = []
    var copyDataArray: [NewsObject] = []
    var currentPage: Int64 = 1
    var footerHeight: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "News"
        
        super.viewWillAppear(animated)
    }
}
