//
//  GridView.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import SwiftUI

struct GridView: View {
    
    @EnvironmentObject var gridModel: GridModel
    var grid: [Int]
    let rows:[GridItem] = [
        GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
        GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
        GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
        GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
        GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35))
    ]
    
    func calDisplayCols() -> Int {
        switch (grid.count / 5) {
        case 5:
            return 5
        case 4:
            return 4
        case 3:
            return 3
        default:
            return 7
        }
    }
    
    var body: some View {
        
        LazyHGrid(rows: rows, alignment: .center, spacing: 18) {
            ForEach(0..<grid.count, id: \.self) { index in
                Text("\(grid[index])")
            }
        } // close LazyHGrid
        
    } // close body
    
} // close GridView: View
