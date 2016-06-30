//
//  Swap.swift
//  CookieCrunch
//
//  Created by Jack Zhao on 2016-06-30.
//  Copyright © 2016 Jack Zhao. All rights reserved.
//

import Foundation

struct Swap: CustomStringConvertible, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
}

func ==(lhs: Swap, rhs: Swap) -> Bool {
    return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB)
        || (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
}