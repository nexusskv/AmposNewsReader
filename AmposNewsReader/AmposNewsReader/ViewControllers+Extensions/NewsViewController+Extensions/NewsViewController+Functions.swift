//
//  NewsViewController+Functions.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension NewsViewController {
    
    
    func setupUI() {       
        searhBar.placeholder = "Search"
        
        if let nc = navigationController {
            NavigationBarManager.changeNavigationBar(nc)
        }
        
        addSpinnerToTableBottom()
        
        spinnerView.isHidden    = false
        spinnerView.startAnimating()
        
        footerHeight = 44.0
        loadNews(currentPage)
    }
    
    
    func refreshNews(_ news: [NewsObject]) {
        self.dataArray      = news
        self.copyDataArray  = news
        
        self.dataTable.reloadData()
        
        if currentPage > 1 {
            scrollToTopNews()
        }
    }
    
    
    func addSpinnerToTableBottom() {
        let spinnerRect = CGRect(x: 0, y: 0, width: dataTable.bounds.width, height: 44)
        let tableSpinner = UIActivityIndicatorView(style: .gray)
        tableSpinner.startAnimating()
        tableSpinner.frame                  = spinnerRect
        dataTable.tableFooterView           = tableSpinner
        dataTable.tableFooterView!.isHidden = true
    }
    
    
    func scrollToTopNews() {
        let newsRow = (currentPage * Int64(pageSize)!) - 1
        let indexPath = IndexPath(row: Int(newsRow), section: 0)
        
        dataTable.scrollToRow(at: indexPath, at: .top, animated: false)
    }
}
