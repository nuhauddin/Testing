//
//  GridModel.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import Foundation

class GridModel: ObservableObject {
    @Published var savedGrids: [(grid: [Int], timestamp: Date)] = [] //grid will now include timestamp
    @Published var currentGrid: [Int] = Array(repeating: 0, count: 35)
    @Published var secondsLeft = 60
    @Published var timerIsActive = false
    @Published var columns = 7
    @Published var displayCols = 7
    @Published var timeInterval = 10
    @Published var arrIndex = 0
    @Published var count = 0
    @Published var total = 0
    let rows = 5
    
    var timer: Timer?
    
    func updateGridSize(columns: Int) {
        self.columns = columns
        currentGrid = Array(repeating: 0, count: columns * rows)
    }
    
    func setTimeInterval(interval: Int) {
        timeInterval = interval
    }
    
    func saveTable() {
        let timestamp = Date()
        savedGrids.append((currentGrid, timestamp))
        currentGrid = Array(repeating: 0, count: columns * rows)
    }
    
    func incrementCount() {
        count += 1
        total += 1
    }

    func resetAllGrids() {
        savedGrids.removeAll()
        currentGrid = Array(repeating: 0, count: columns * rows)
    }
    
    func resetTimer() {
        secondsLeft = 60
        total = 0
        count = 0
        timerIsActive = false
        timer?.invalidate()
    }

    func toggleTimer() {
        if timerIsActive {
            stopTimer()
        } else {
            startTimer()
        }
    }

    func startTimer() {
        total = 0
        count = 0
        secondsLeft = 60
        timerIsActive = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.timerFired()
        }
    }

    func stopTimer() {
        timerIsActive = false
        timer?.invalidate()
        timer = nil
    }

    private func timerFired() {
        if secondsLeft > 0 {
            secondsLeft -= 1
            if secondsLeft % timeInterval == 0 {
                currentGrid[arrIndex] = count
                arrIndex += 1
                count = 0
            }
        } else {
            stopTimer()
            currentGrid[arrIndex] = total
        }
    }
    
} // close GridModel: ObservableObject
