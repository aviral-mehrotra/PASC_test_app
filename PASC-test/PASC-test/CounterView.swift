//
//  Counter.swift
//  PASC-test
//
//  Created by Aviral Mehrotra on 10/18/22.
//

import SwiftUI
import Foundation

struct CounterView: View {
    
    @State private var backgroundColor = Color.green.opacity(0.15)
    @State var clicks = 0
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                
                VStack(spacing: 50) {
                    
                    Spacer()
                    
                    Text("Click counter: \(clicks)")
                        .font(.title)
                        .navigationTitle("PASC Test App")
                    
                    
                    switch clicks {
                    case 0:
                        Text("Click to increase the counter")
                    case 10 ..< 25:
                        Text("Good start!")
                    case 25 ..< 50:
                        Text("Great job!")
                    case 50 ..< 100:
                        Text("Wow!")
                    case 100 ... Int.max:
                        Text("Impressive!")
                    default:
                        Text("")
                    }
                    
                    HStack(spacing: 50) {
                        Button(action: {
                            self.clicks += 1
                        }) {
                            Text("Increase click count")
                        }
                        
                        Button(action: {
                            self.clicks = 0
                        }) {
                            Text("Reset")
                        }
                        
                    }
                    
                    Spacer()
                    
                    ColorPicker("Change background color", selection: $backgroundColor)
                        .padding()
                        .padding(.bottom, 100)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
            .ignoresSafeArea()
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
