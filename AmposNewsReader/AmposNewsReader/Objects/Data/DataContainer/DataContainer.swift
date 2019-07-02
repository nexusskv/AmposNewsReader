//
//  DataContainer.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class DataContainer {
    static let shared = DataContainer()
    
    var selectedNews: NewsObject?
    
    var totalNews: Int64?
    
    private init() { }
}
