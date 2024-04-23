//
//  ThirtysecView.swift
//  OMAT
//
//  Created by Spring2024 Capstone Team

import SwiftUI
import AudioToolbox

struct ThirtysecView: View {
    @EnvironmentObject var gridModel: GridModel
    
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = false
    @State var count: Int=0
    
    // variables to control the width and height of the 5 test buttons
    @State var testbuttonswidth: CGFloat=120
    @State var testbuttonsheight: CGFloat=30
    
    // variables to name the buttons
    @State var buttonTestReset = "H. Saccades \n Reset"
    @State var resetAll = "Reset All"
    @State var hsaccades = "H. Saccades"
    @State var vsaccades = "V. Saccades"
    @State var vergence = "Vergence"
    @State var hvor = "H. VOR"
    @State var vvor = "V. VOR"
    @State var buttonStartText = "Start"
    
    // creating an array with 0s for the grid
    @State var arr1:[Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    // for info button popup
    @State private var showInfoPopover = false
    
    // variables used to control the buttons
    //   taphsaccades stays true from the beginning so when the app loads,
    //   that button will be green
    @State private var taphsaccades:Bool = true
    @State private var tapvsaccades:Bool = false
    @State private var tapvergence:Bool = false
    @State private var taphvor:Bool = false
    @State private var tapvvor:Bool = false
    
    // creates rows for the buttons and assigns spacing between them
    let rows:[GridItem] = [
                            GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
                            GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
                            GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
                            GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35)),
                            GridItem(.flexible(minimum: (1), maximum: (5)), spacing: (35))
                            ]
    
    var body: some View {
        
        // Vertically stacking everything on the page; "Full VStack"
        VStack(content: {
            
            HStack(content: {
                
                // Stacking Time Remaining, row of buttons, and Movements on top of each other
                VStack(content: {
                    
                    // Time Remaining
                    Text("Time Remaining: \(timeRemaining)")
                        .font(.title2)
                        .onAppear {
                            gridModel.updateGridSize(columns: 3)
                            gridModel.setTimeInterval(interval: 30)
                        }
                    
                    // Row containing buttons: Info, 5Tests Reset, Reset All, Save Data, View Data
                    HStack(spacing: 20, content: {
                        
                        // Info Button
                        Button(action: {
                            showInfoPopover.toggle()
                        }) {
                            Image(systemName: "info")
                                .frame(width: 40, height: 100)
                                .imageScale(.large)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                //.background(RoundedRectangle(cornerRadius: 5).fill(Color.blue).scaledToFill())
                                .background(Color.mint)
                                .contentShape(Rectangle()) // Add this line
                        }
                        .popover(isPresented: $showInfoPopover) { InfoView() }
                        
                        // Reset Button for the 5 tests
                        // when the button is clicked, that row becomes 0s. time&count is reset
                        Button(action: {
                            if buttonTestReset == "H. Saccades \n Reset"{
                                arr1[0] = 0
                                arr1[5] = 0
                                arr1[10] = 0
                                timeRemaining = 60
                                isActive = false
                                count = 0
                                buttonStartText = "Start"
                            }
                            if buttonTestReset == "V. Saccades \n Reset"{
                                arr1[1] = 0
                                arr1[6] = 0
                                arr1[11] = 0
                                timeRemaining = 60
                                isActive = false
                                count = 0
                                buttonStartText = "Start"
                            }
                            if buttonTestReset == "Vergence \n Reset"{
                                arr1[2] = 0
                                arr1[7] = 0
                                arr1[12] = 0
                                timeRemaining = 60
                                isActive = false
                                count = 0
                                buttonStartText = "Start"
                            }
                            if buttonTestReset == "H. VOR \n Reset"{
                                arr1[3] = 0
                                arr1[8] = 0
                                arr1[13] = 0
                                timeRemaining = 60
                                isActive = false
                                count = 0
                                buttonStartText = "Start"
                            }
                            if buttonTestReset == "V. VOR \n Reset"{
                                arr1[4] = 0
                                arr1[9] = 0
                                arr1[14] = 0
                                timeRemaining = 60
                                isActive = false
                                count = 0
                                buttonStartText = "Start"
                            }
                            
                        }) {
                            Text(buttonTestReset)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 100)
                                .background(Color.orange)
                                .contentShape(Rectangle()) // Add this line
                        }
                        
                        // Reset All Button
                        Button(action: {
                            timeRemaining = 60
                            isActive = false
                            count = 0
                            arr1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
                            self.taphsaccades = true
                            self.tapvsaccades = false
                            self.tapvergence = false
                            self.taphvor = false
                            self.tapvvor = false
                            buttonStartText = "Start"
                        }) {
                            Text(resetAll)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 100)
                                .background(Color.red)
                                .contentShape(Rectangle())
                        }
                        
                        VStack{
                            // Save table data button
                            Button(action: {
                                gridModel.saveTable()
                            }) {
                                Image("save")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.mint)
                            
                            // View saved data button
                            NavigationLink(destination: SavedGridsView()) {
                                        Image("recent")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    }
                                   .foregroundColor(.white)
                                   .frame(width: 50, height: 50)
                                   .background(Color.mint)
                           }
                    }) // end of HStack
                    
                    // Movements (place to display track of counts)
                    Text("Movements: \(count) ")
                        .foregroundColor(.blue)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    //  .padding([.bottom], 30)
                    
                }) // end of VStack
                
            }) // end of HStack
      
            // ---------------------------------------------------------------------------------------
            
            // labels of columns
            HStack(spacing: 15, content: {
                Text("0-30s").font(.system(size: 9))
                Text("30-60s").font(.system(size: 9))
                Text("Total").font(.system(size: 9))
            }).padding(.leading, 150)
                    
            // Creating Grid of test buttons and columns for the numbers
            LazyHGrid(rows: rows, alignment: .center, spacing: 30){
                
                // H. Saccades button
                Button(hsaccades) {
                    self.taphsaccades = true // H. Saccades is selected when app loads
                    self.tapvsaccades = false
                    self.tapvergence = false
                    self.taphvor = false
                    self.tapvvor = false
                    
                    // when this button is clicked, the time, movements count, and start button should be reset
                    timeRemaining = 60
                    isActive = false
                    count = 0
                    buttonStartText = "Start"
                    
                    buttonTestReset = "H. Saccades \n Reset" } // Test Reset button says "H. Saccades" when app loads
                        .frame(width: testbuttonswidth, height: testbuttonsheight)
                        .foregroundColor(taphsaccades ? Color.black : Color.white)
                        .background(taphsaccades ? Color.green : Color.gray)
                
                // V. Saccades Buttom
                Button(vsaccades) {
                    self.taphsaccades = false
                    self.tapvsaccades = true // Only this button should be green when clicked
                    self.tapvergence = false
                    self.taphvor = false
                    self.tapvvor = false
                    
                    // when this button is clicked, the time, movements count, and start button should be reset
                    timeRemaining = 60
                    isActive = false
                    count = 0
                    buttonStartText = "Start"
                    
                    buttonTestReset = "V. Saccades \n Reset" }// Change Test Reset button text when this button is clicked
                    .frame(width: testbuttonswidth, height: testbuttonsheight)
                    .foregroundColor(tapvsaccades ? Color.black : Color.white)
                    .background(tapvsaccades ? Color.green : Color.gray)
                
                // Vergence Button
                Button(vergence) {
                    self.taphsaccades = false
                    self.tapvsaccades = false
                    self.tapvergence = true // Only this button should be green when clicked
                    self.taphvor = false
                    self.tapvvor = false
                    
                    // when this button is clicked, the time, movements count, and start button should be reset
                    timeRemaining = 60
                    isActive = false
                    count = 0
                    buttonStartText = "Start"
                    
                    buttonTestReset = "Vergence \n Reset" }// Change Test Reset button text when this button is clicked
                    .frame(width: testbuttonswidth, height: testbuttonsheight)
                    .foregroundColor(tapvergence ? Color.black : Color.white)
                    .background(tapvergence ? Color.green : Color.gray)
                
                // H. VOR Button
                Button(hvor) {
                    self.taphsaccades = false
                    self.tapvsaccades = false
                    self.tapvergence = false
                    self.taphvor = true // Only this button should be green when clicked
                    self.tapvvor = false
                    
                    // when this button is clicked, the time, movements count, and start button should be reset
                    timeRemaining = 60
                    isActive = false
                    count = 0
                    buttonStartText = "Start"
                    
                    buttonTestReset = "H. VOR \n Reset" }// Change Test Reset button text when this button is clicked
                    .frame(width: testbuttonswidth, height: testbuttonsheight)
                    .foregroundColor(taphvor ? Color.black : Color.white)
                    .background(taphvor ? Color.green : Color.gray)
                
                // V. VOR Button
                Button(vvor) {
                    self.taphsaccades = false
                    self.tapvsaccades = false
                    self.tapvergence = false
                    self.taphvor = false
                    self.tapvvor = true // Only this button should be green when clicked
                    
                    // when this button is clicked, the time, movements count, and start button should be reset
                    timeRemaining = 60
                    isActive = false
                    count = 0
                    buttonStartText = "Start"
                    
                    buttonTestReset = "V. VOR \n Reset" }// Change Test Reset button text when this button is clicked
                    .frame(width: testbuttonswidth, height: testbuttonsheight)
                    .foregroundColor(tapvvor ? Color.black : Color.white)
                    .background(tapvvor ? Color.green : Color.gray)
                
                
                    // INDEX THROUGH THIS ARRAY AND PASTE COUNT VALUES AT PROPER INDEX
                    ForEach(arr1.indices, id: \.self){ index in
                        Text("\(arr1[index])")
                    }
                    .onReceive(timer) { _ in
                        if timeRemaining == 30 {           // when the time reaches 30 seconds
                            if self.taphsaccades {         // if h.saccades button is clicked
                                arr1[0] = count            // updates the index with the count
                            }
                            else if self.tapvsaccades {    // if v.saccades button is clicked
                                arr1[1] = count            // updates the index with the count
                            }
                            else if self.tapvergence {     // if vergence button is clicked
                                arr1[2] = count            // updates the index with the count
                            }
                            else if self.taphvor {         // if hvor button is clicked
                                arr1[3] = count            // updates the index with the count
                            }
                            else if self.tapvvor {         // if vvor button is clicked
                                arr1[4] = count            // updates the index with the count
                            }
                        }
                        else if timeRemaining == 0 {       // when the time reaches 0 seconds
                            if self.taphsaccades {         // if h.saccades button is clicked
                                arr1[5] = count - arr1[0]  // updates the index with the count
                            }
                            else if self.tapvsaccades {    // if v.saccades button is clicked
                                arr1[6] = count - arr1[1]  // updates the index with the count
                            }
                            else if self.tapvergence {     // if vergence button is clicked
                                arr1[7] = count - arr1[2]  // updates the index with the count
                            }
                            else if self.taphvor {         // if hvor button is clicked
                                arr1[8] = count - arr1[3]  // updates the index with the count
                            }
                            else if self.tapvvor {         // if vvor button is clicked
                                arr1[9] = count - arr1[4]  // updates the index with the count
                            }
                            // Phone vibrates when timer ends
                            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)){}
                        }
                        // To calculate the last column: TOTAL
                        if self.taphsaccades {
                            arr1[10] = arr1[0] + arr1[5]
                        }
                        if self.tapvsaccades{
                            arr1[11] = arr1[1] + arr1[6]
                        }
                        if self.tapvergence {
                            arr1[12] = arr1[2] + arr1[7]
                        }
                        if self.taphvor {
                            arr1[13] = arr1[3] + arr1[8]
                        }
                        if self.tapvvor {
                            arr1[14] = arr1[4] + arr1[9]
                        }
                    gridModel.currentGrid = arr1
                } // close onReceive(timer)
                
            } // end of LazyHGrid
            
            // ---------------------------------------------------------------------------------------
            
            // Placing GeometryReader to have start button fill the rest of the screen
            GeometryReader { metrics in
                // Placing Start/Count button in a VStack
                VStack(content: {
                    
                    Button(action: {
                        buttonStartText = "Count" // Changing text to "Count" once clicked
                        if isActive == true{
                            if timeRemaining > 0 {
                                self.count += 1 } }
                        isActive = true
                    }) {
                        Text(self.buttonStartText)
                           .frame(width: 300)
                           .padding(100.0)
                           .foregroundColor(Color.white)
                           .contentShape(Rectangle()) // Add this line
                    }
                    .foregroundColor(.white)
                    .frame(width: metrics.size.width, height: metrics.size.height)
                    .background(Color.blue)
                    
                }) // end VStack
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onReceive(timer) { time in
                if isActive == true{
                    if timeRemaining > 0 { // if time remaining is still more than 0 seconds
                        timeRemaining -= 1 // then subtract 1 second from the time
                    }
                }else{
                    isActive = false
                }
            }
            
        }) // closing "Full VStack"
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
    } // close body
    
} // close ThirtysecView: View

#Preview {
    ThirtysecView()
}
