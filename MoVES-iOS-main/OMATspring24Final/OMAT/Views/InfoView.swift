//
//  InfoView.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        
        VStack(content: {
            
            VStack {
                Text("Slide down to close")
                    .padding()
                    .font(.system(size: 10))
                
                HStack{
                    Image("SQRL")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(150)
                        .padding(.top, 20)
                    Text("MoVes Normative Data")
                        .padding()
                        .font(.system(size: 20))
                } // close HStack
                
                ChartView()
                    .padding()
                
                Text("Yaramothu C, et al. OculoMotor Assessment Tool Test Procedure and Normative Data. Optom Vis Sci. 2021 Jun 98(6):636-643. doi: 10.1097/OPX.0000000000001698 MoVES Protocol: https://research.njit.edu/sqrl/moves")
                    .padding()
                    .font(.system(size: 12))
                
            } // close VStack
            
        }) // close VStack
        
    } // close body
    
} // close InfoView: View



struct ChartView: View {
    
    var body: some View {
        
        ScrollView {
            
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
                    ChartCell(label: "Normal Range (1SD)")
                        .bold()
                        .font(.headline)
                    Divider()
                        .background(Color.blue)
                } // close HStack
                
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
                } // close HStack
                
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
                } // close HStack
                
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
                } // close HStack
                
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
                } // close HStack
                
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
                } // close HStack
                
            } // close VStack
            .padding()
            
        } // close ScrollView
        
    } // close body

    struct ChartCell: View {
        
        var label: String?
        
        var body: some View {
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.clear)
                    .frame(width:88, height: 10)
                if let label = label{
                    Text(label)
                        .font(.system(size: 17))
                }
            } // close ZStack
            
        } // close body
        
    } // close ChartCell: View
    
} // close ChartView: View

#Preview {
    InfoView()
}
