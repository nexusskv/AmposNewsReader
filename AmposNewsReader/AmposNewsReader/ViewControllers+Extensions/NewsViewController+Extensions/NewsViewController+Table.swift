//
//  NewsViewController+Table.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    /// ---> Table view data source methods <--- ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell
        
        let newsObject: NewsObject = self.dataArray[indexPath.row]
        
        cell?.setCellValues(newsObject)

        return cell ?? NewsCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 271.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footerHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedNews = dataArray[indexPath.row]
        
        DataContainer.shared.selectedNews = selectedNews
    }
}
