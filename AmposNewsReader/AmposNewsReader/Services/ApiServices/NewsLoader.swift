//
//  NewsLoader.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class NewsLoader {
    
    
    /// ---> Function for load data from API <--- ///
    static func loadData(_ page: Int64, completion: ((_ response: AnyObject) -> Void)?) {
        let urlString = "\(apiUrl)=\(sources)&page=\(page)&pageSize=\(pageSize)&apiKey=\(apiKey)"
        
        guard let resultUrl = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: resultUrl)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print(error ?? "Unknown error")
                completion!(false as AnyObject)
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let jsonValues = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
                    
                    if let message = jsonValues["message"] as? String {
                        DispatchQueue.main.async {
                            completion!(message as AnyObject)
                        }
                    } else {
                        if let total = jsonValues["totalResults"] as? Int64 {
                            if total > 0 {
                                DataContainer.shared.totalNews = total
                            }
                        }
                        
                        if let news = jsonValues["articles"] as? [[String: Any]] {
                            if news.count > 0 {
                                let handledNews = JsonHandler.handleJson(news)
                                
                                DispatchQueue.main.async {
                                    completion!(handledNews as AnyObject)
                                }
                            } else {
                                DispatchQueue.main.async {
                                    completion!(false as AnyObject)
                                }
                            }
                        } else {
                            DispatchQueue.main.async {
                                completion!(false as AnyObject)
                            }
                        }
                    }
                } catch {
                    print(error)
                    DispatchQueue.main.async {
                        completion!(false as AnyObject)
                    }
                }
            }
        })
        
        task.resume()
    }
}
