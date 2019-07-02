//
//  DetailsViewController.swift
//  AmposNewsReader
//
//  Created by Rost on 6/23/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class DetailsViewController: UIViewController {
    @IBOutlet weak var newsWebView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let news = DataContainer.shared.selectedNews {
            if !news.newsUrl.isEmpty {
                if let url = URL(string: news.newsUrl) {
                    newsWebView.load(URLRequest(url: url))
                }
            }
        }
    }
}
