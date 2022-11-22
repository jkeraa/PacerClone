//
//  ContentView.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 15/11/22.
//

import SwiftUI

import CoreMotion

struct ContentView: View {
     
    var x = PedometerManager()
    private func initializePedometer() {
        
    }
    
    var body: some View {
        
        TabBarView()
    
        }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
