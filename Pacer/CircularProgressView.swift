//
//  CircularProgressView.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 21/11/22.
//

import SwiftUI

struct CircularProgressView: View {
    @EnvironmentObject var uau: PedometerManager
    
   
    let progress = 0.0
    
    var body: some View {
        ZStack { // 1
                    Circle()
                        .stroke(
                            Color.gray.opacity(0.5),
                            lineWidth: 30
                        )
            Text(String(uau.x))
            
                .font(.largeTitle)
                .foregroundColor(Color.blue)
            
            
                    Circle() // 2
                .trim(from: 0, to: Double(uau.x) / 10000)
                        .stroke(
                            Color.green.opacity(0.9),
                            style: StrokeStyle(
                                                    lineWidth: 30,
                                                    lineCap: .round
                                                )
                        ).rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            
                }.frame(width: 150, height: 150)
    }
}


struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}



