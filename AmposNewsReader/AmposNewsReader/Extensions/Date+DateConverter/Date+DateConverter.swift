//
//  Date+DateConverter.swift
//  AmposNewsReader
//
//  Created by Rost on 6/24/19.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension Date {

    
    static func convert(_ string: String, income: String, result: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone?
        dateFormater.dateFormat = income
        let date = dateFormater.date(from: string)
        
        dateFormater.timeZone = NSTimeZone.system
        
        dateFormater.dateFormat = result
        
        let timeResult = dateFormater.string(from: date!)
        
        return timeResult
    }
}
