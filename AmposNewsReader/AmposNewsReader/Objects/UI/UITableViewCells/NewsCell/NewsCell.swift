//
//  NewsCell.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class NewsCell: UITableViewCell {
    @IBOutlet weak var newsImage: AsyncImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescript: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    
    func setCellValues(_ object: NewsObject) {
        if !object.imageUrl.isEmpty {
            newsImage.loadAsync(object.imageUrl, placeholder: UIImage(named: "defaultImage"))
        }
        
        if !object.newsTitle.isEmpty {
            newsTitle.text = object.newsTitle
        }
        
        if !object.newsDescrip.isEmpty {
            newsDescript.text = object.newsDescrip
        }
        
        if !object.publishedAt.isEmpty {
            newsDate.text = "Updated: " + object.publishedAt
        }
    }
}
