//
//  DecimalUtil.swift
//  Banker
//
//  Created by Sean Murphy on 6/5/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
