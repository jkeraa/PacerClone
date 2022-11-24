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
                            Color.black.opacity(0.3),
                            lineWidth: 30
                        )
            Text(String(uau.x))
          //  Text("1000")
                .font(.largeTitle)
                .foregroundStyle(LinearGradient(
                    colors: [Color.blue, Color.cyan],
                    startPoint: .top, endPoint: .bottom))
            
            
                    Circle() // 2
                .trim(from: 0, to: Double(uau.x) / 10000)
               // .trim(from: 0, to: 0.5)
               // .trim(from: 0, to: 0.5)
                        .stroke(
                            
                            style: StrokeStyle(
                                                    lineWidth: 30,
                                                    lineCap: .round
                                                )
                        ).rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
                .foregroundStyle(LinearGradient(
                    colors: [Color.blue, Color.cyan],
                    startPoint: .top, endPoint: .bottom))
                }.frame(width: 150, height: 150)
        
    }
}


struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}



