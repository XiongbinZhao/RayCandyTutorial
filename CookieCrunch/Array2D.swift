//
//  Array2D.swift
//  CookieCrunch
//
//  Created by Jack Zhao on 2016-06-29.
//  Copyright © 2016 Jack Zhao. All rights reserved.
//

struct Array2d<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows*columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row * columns + column]
        }
        set {
            array[row * columns + column] = newValue
        }
    }
}
