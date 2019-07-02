//
//  NewsViewController+ScrollView.swift
//  AmposNewsReader
//
//  Created by Rost on 6/25/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension NewsViewController {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            if let total = DataContainer.shared.totalNews {
                if copyDataArray.count > 5 && copyDataArray.count < total {
                    dataTable.tableFooterView!.isHidden = false
                    
                    footerHeight = 44.0
                    
                    currentPage += 1
                    loadNews(currentPage)
                }
            }
        }
    }
}
