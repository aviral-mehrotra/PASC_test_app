//
//  ContentView.swift
//  PASC-test
//
//  Created by Aviral Mehrotra on 9/28/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
    }
    
    var body: some View {
        
        TabView {
            CounterView()
                .tabItem {
                    Label("Counter", systemImage: "plus")
                }
            CameraView()
                .tabItem {
                    Label("Photos", systemImage: "camera")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
