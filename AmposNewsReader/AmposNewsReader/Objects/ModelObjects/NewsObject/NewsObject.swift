//
//  NewsObject.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


struct NewsObject: Codable {
    var newsId: Int64           = 0
    var sourceId: String        = ""
    var sourceName: String      = ""
    var author: String          = ""
    var newsTitle: String       = ""
    var newsDescrip: String     = ""
    var newsUrl: String         = ""
    var imageUrl: String        = ""
    var publishedAt: String     = ""
    var content: String         = ""
    
    
    static func make(_ json: [String: Any], ident: Int64) -> NewsObject {
        var newsObject = NewsObject()
        newsObject.newsId = ident
        
        if let source = json["source"] as? [String: Any] {
            if let value = source["id"] as? String {
                if value != "null" {
                    newsObject.sourceId = value
                }
            }
            
            if let value = source["name"] as? String {
                if value != "null" {
                    newsObject.sourceName = value
                }
            }
        }
        
        if let value = json["author"] as? String {
            if value != "null" {
                newsObject.author = value
            }
        }
        
        if let value = json["title"] as? String {
            if value != "null" {
                newsObject.newsTitle = value
            }
        }
        
        if let value = json["description"] as? String {
            if value != "null" {
                newsObject.newsDescrip = value
            }
        }
        
        if let value = json["url"] as? String {
            if value != "null" {
                newsObject.newsUrl = value
            }
        }
        
        if let value = json["urlToImage"] as? String {
            if value != "null" {
                newsObject.imageUrl = value
            }
        }
        
        if let value = json["publishedAt"] as? String {
            if value != "null" {
                let resultDate = Date.convert(value,
                                              income: "yyyy-MM-dd'T'HH:mm:ss'Z'",
                                              result: "MMMM dd, HH:mm")
                
                newsObject.publishedAt = resultDate
            }
        }
        
        if let value = json["content"] as? String {
            if value != "null" {
                newsObject.content = value
            }
        }
        
        return newsObject
    }
}

