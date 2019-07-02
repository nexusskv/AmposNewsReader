//
//  NewsViewController+SearchBar.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension NewsViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContent(searchText)
    }
    
    func filterContent(_ text: String) {
        if !text.isEmpty && text.count > 1 {
            self.dataArray = copyDataArray.filter { news in
                let isType      = news.sourceName.lowercased().contains(text.lowercased())
                let isTitle     = news.newsTitle.lowercased().contains(text.lowercased())
                let isDescrip   = news.newsDescrip.lowercased().contains(text.lowercased())
                let isDate      = news.publishedAt.lowercased().contains(text.lowercased())
                
                return isType || isTitle || isDescrip || isDate
            }
        } else {
            self.dataArray = self.copyDataArray
        }
        
        self.dataTable.reloadData()
    }
}
