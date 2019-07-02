//
//  NewsViewController+Services.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension NewsViewController {
    
   
    func loadNews(_ page: Int64) {
        NewsLoader.loadData(page) { [weak self] (result) in
            guard let strongSelf = self else { return }
            
            strongSelf.footerHeight = 0.0
            
            if let news = result as? [NewsObject] {
                strongSelf.refreshNews(news)
            } else {
                if let message = result as? String {
                    AlertPresenter.showAlert(strongSelf, message: message)
                } else {
                    AlertPresenter.showAlert(strongSelf, message: "Download news error!")
                }
            }
            
            strongSelf.spinnerView.isHidden                 = true
            
            strongSelf.dataTable.tableFooterView!.isHidden  = true
        }
    }
}
