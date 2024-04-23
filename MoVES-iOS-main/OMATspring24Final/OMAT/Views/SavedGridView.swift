//
//  SavedGridsView.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import SwiftUI

struct SavedGridsView: View {
    @EnvironmentObject var gridModel: GridModel
    
    var body: some View {
        
        List {
            
            ForEach(gridModel.savedGrids.reversed(), id: \.timestamp) { grid in
                Text("\(timestampFormat(for: grid.timestamp))") // Displays the timestamp
                    .font(.headline)
                    .padding(.bottom, 8)
                
                HStack {
                    Spacer()
                    
                    VStack{
                        Text("H. Saccades").padding([.top,.bottom], 4)
                        Text("V. Saccades").padding([.top,.bottom], 4)
                        Text("Vergence").padding([.top,.bottom], 4)
                        Text("H. VOR").padding([.top,.bottom], 4)
                        Text("V. VOR").padding([.top,.bottom], 4)
                    }
                    Spacer()
                    GridView(grid: grid.grid) //passes the grid part only (savedGrids var includes grid and timestamp)
                    Spacer()
                    
                } //close HStach
                .padding()
                .frame(height: 180)
                
            } // close ForEach
            
        } // close List
        .navigationTitle("Saved Grids")
        
    } // close body
    
    //timestamp function
    private func timestampFormat(for date: Date) -> String {
        let timeFormat = DateFormatter() //formats the date and time
        timeFormat.timeStyle = .short //the time will be in the format 00:00 PM/AM
        timeFormat.dateStyle = .long //the date will be in the format MONTH DAY, YEAR
        return timeFormat.string(from: date)
    }
    
} // close SavedGridsView: View
