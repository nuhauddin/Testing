//
//  InfoView.swift
//  OMAT
//
//  Created by Nuha Uddin on 3/18/24.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(content: {
            VStack {
                Text("Slide down to close")
                .padding()
                .font(.system(size: 10))
                Text("MoVes Normative Data")
                .padding()
                .font(.system(size: 20))
                ChartView()
                .padding()
                Text("Yaramothu, C. et al. OculoMotor Assessment Tool Test Procedure and Normative Data, Optometry and Vision Science: March 2024")
                .padding()
                .font(.system(size: 12))
                }
        })
    }
}

struct ChartView: View {
    var body: some View {
        ScrollView{
            
        VStack(spacing: 10) {
            //First Row
            HStack(spacing: 10){
                ChartCell(label:"Test")
                    .bold()
                    .font(.headline)
                    Divider()
                        .background(Color.blue)
                ChartCell(label: "Time Interval")
                    .bold()
                    .font(.headline)
                    Divider()
                        .background(Color.blue)
                ChartCell(label: "Normal (1SD)")
                    .bold()
                    .font(.headline)
                    Divider()
                        .background(Color.blue)
            }
            
            Divider()
                .background(Color.blue)
            
            //Second Row
            HStack(spacing: 20) {
                ChartCell(label: "Horizontal Saccades")
                    .bold()
                    .font(.headline)
                VStack(spacing: 10) {
                    ChartCell(label: "Initial 30s")
                    ChartCell(label: "Latter 30s")
                    ChartCell(label: "60s")
                }
                VStack(spacing: 10) {
                    ChartCell(label: "55-85")
                    ChartCell(label: "50-76")
                    ChartCell(label: "106-160")
                }
            }
            
            Divider()
                .background(Color.blue)
            
            //Third Row
            HStack(spacing: 20) {
                ChartCell(label: "Vertical Saccades")
                    .bold()
                    .font(.headline)
                VStack(spacing: 10) {
                    ChartCell(label: "Initial 30s")
                    ChartCell(label: "Latter 30s")
                    ChartCell(label: "60s")
                }
                VStack(spacing: 10) {
                    ChartCell(label: "54-81")
                    ChartCell(label: "50-76")
                    ChartCell(label: "105-156")
                }
            }
            
            Divider()
                .background(Color.blue)
            
            //Fourth Row
            HStack(spacing: 20) {
                ChartCell(label: "Vergence Jumps")
                    .bold()
                    .font(.headline)
                VStack(spacing: 10) {
                    ChartCell(label: "Initial 30s")
                    ChartCell(label: "Latter 30s")
                    ChartCell(label: "60s")
                }
                VStack(spacing: 10) {
                    ChartCell(label: "32-54")
                    ChartCell(label: "28-50")
                    ChartCell(label: "60-104")
                }
            }
            
            Divider()
                .background(Color.blue)
            
            //Fifth Row
            HStack(spacing: 20) {
                ChartCell(label: "Horizontal VOR")
                    .bold()
                    .font(.headline)
                VStack(spacing: 10) {
                    ChartCell(label: "Initial 30s")
                    ChartCell(label: "Latter 30s")
                    ChartCell(label: "60s")
                }
                VStack(spacing: 10) {
                    ChartCell(label: "25-47")
                    ChartCell(label: "26-47")
                    ChartCell(label: "52-94")
                }
            }
            
            Divider()
                .background(Color.blue)
            
            //Sixth Row
            HStack(spacing: 20) {
                ChartCell(label: "Vertical     VOR")
                    .bold()
                    .font(.headline)
                VStack(spacing: 10) {
                    ChartCell(label: "Initial 30s")
                    ChartCell(label: "Latter 30s")
                    ChartCell(label: "60s")
                }
                VStack(spacing: 10) {
                    ChartCell(label: "26-48")
                    ChartCell(label: "27-39")
                    ChartCell(label: "54-97")
                }
            }
            
            
            
        }
        .padding()
    }
}

struct ChartCell: View {
    var label: String?
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.clear)
                .frame(width:88, height: 10)
            if let label = label{
                Text(label)
                    .font(.system(size: 17))
            }
        }
    }
    }
}

#Preview {
    InfoView()
}
