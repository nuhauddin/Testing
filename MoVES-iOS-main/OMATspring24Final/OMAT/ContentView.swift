//
//  ContentView.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import SwiftUI

struct ContentView: View {
    
    var body: some View {
                
        NavigationStack{ // to add links to each button to lead to another page
                
            GeometryReader { geometry in // to allow the buttons to take up proper space
                
                VStack(spacing: 20) { // vertically stacking everything on the page
                    
                    // have the OMAT logo and page title next to each other
                    HStack(spacing: 5, content: {
                        
                        // OMAT logo
                        Image("omatlogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        
                        // Title at the top
                        Text("Select Time Interval")
                            .font(.largeTitle)
                        
                    }).frame(width: geometry.size.width, height: geometry.size.height/10) // the height of this HStack is 1/10 of the page
                        // close HStack
                   
                    // 10 Second Button
                    NavigationLink {
                        //Your destination here
                        TensecView()//.toolbarRole(.editor)
                            //.navigationTitle("Ten Second View")
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.blue.opacity(1))
                            Text("10 Seconds")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height/5) // the height is 1/5 of the page
                    
                    // 15 Second Button
                    NavigationLink {
                        //Your destination here
                        FifteensecView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.blue.opacity(0.9))
                            Text("15 Seconds")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height/5) // the height is 1/5 of the page
                    
                    // 20 Second Button
                    NavigationLink {
                        //Your destination here
                        TwentysecView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.blue.opacity(0.8))
                            Text("20 Seconds")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height/5) // the height is 1/5 of the page
                    
                    // 30 Second Button
                    NavigationLink {
                        //Your destination here
                        ThirtysecView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.blue.opacity(0.7))
                            Text("30 Seconds")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }.frame(width: geometry.size.width, height: geometry.size.height/5) // the height is 1/5 of the page
                    
                } // close VStack
                
            } // close GeometryReader

        } // close NavigationStack
        
    } // close body
    
} // close ContentView: View

#Preview {
    ContentView()
}
