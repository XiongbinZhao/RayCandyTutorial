//
//  Level.swift
//  CookieCrunch
//
//  Created by Jack Zhao on 2016-06-29.
//  Copyright © 2016 Jack Zhao. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    
    private var cookies = Array2d<Cookie>(columns: NumColumns, rows: NumRows)
    private var tiles = Array2d<Tile>(columns: NumColumns, rows: NumRows)
    
    init(filename: String) {
        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) else {
            return
        }
        
        guard let tilesArray = dictionary["tiles"] as? [[Int]] else {
            return
        }
        
        for (row, rowArray) in tilesArray.enumerate() {

            let tileRow = NumRows - row - 1

            for (column, value) in rowArray.enumerate() {
                if value == 1 {
                    tiles[column, tileRow] = Tile()
                }
            }
        }
    }
    
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func tileAtColumn(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                
                if tiles[column, row] != nil {
                    let cookieType = CookieType.random()
                    
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    cookies[column, row] = cookie
                    
                    set.insert(cookie)
                }
                
            }
        }
        
        return set
    }
}




