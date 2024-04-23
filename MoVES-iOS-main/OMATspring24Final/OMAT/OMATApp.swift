//
//  OMATApp.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import SwiftUI

@main
struct OMATApp: App {
    
    var gridModel = GridModel()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
        .environmentObject(gridModel)
    } //close body
    
} //close OMATApp: App

