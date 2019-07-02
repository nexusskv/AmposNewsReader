//
//  JsonHandler.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class JsonHandler {
    
    
    /// ---> Handle json function  <--- ///
    static func handleJson(_ json: [[String: Any]]) -> [NewsObject] {
        var handleResult: [NewsObject] = []

        var count: Int64 = 0
        for news in json {
            let newsObject = NewsObject.make(news, ident: count)
            
            handleResult.append(newsObject)
            
            count += 1
        }
                
        return handleResult
    }
}
