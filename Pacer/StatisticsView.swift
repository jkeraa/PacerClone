//
//  StatisticsView.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 17/11/22.
//

import SwiftUI
import Charts

struct StatisticsView: View {
    @EnvironmentObject var uau: PedometerManager
   
    var body: some View {
        
        VStack{
            HStack {
                Chart {
                    BarMark(
                        x: .value("Giorno", "6 giorni fa"),
                        y: .value("Passi", uau.sei)
                    )
                    BarMark(
                        x: .value("Giorno", "5 giorni fa"),
                        y: .value("Passi", uau.cinque)
                    )
                    BarMark(
                        x: .value("Giorno", "4 giorni fa"),
                        y: .value("Passi", uau.quattro)
                    )
                    BarMark(
                        x: .value("Giorno", "3 giorni fa"),
                        y: .value("Passi", uau.tre)
                    )
                    BarMark(
                        x: .value("Giorno", "2 giorni fa"),
                        y: .value("Passi", uau.due)
                    )
                    BarMark(
                        x: .value("Giorno", "ieri"),
                        y: .value("Passi", uau.uno)
                    )
                    BarMark(
                        x: .value("Giorno", "oggi"),
                        y: .value("Passi", uau.x)
                    )
                }
            }
            HStack {
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    print(uau.x)
                    
                    
                }
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    print(uau.uno)
                    print(uau.due)
                    print(uau.tre)
                    print(uau.quattro)
                    print(uau.cinque)
                    print(uau.sei)
                }
                }
        }.onAppear {
            uau.pedometer.queryPedometerData(from: Date().dayBefore, to: Date().mattina) { (data, error) in
                uau.uno = Int(truncating: data!.numberOfSteps)
            }
            uau.pedometer.queryPedometerData(from: Date().dayBefore2, to: Date().dayBefore) { (data, error) in
                uau.due = Int(truncating: data!.numberOfSteps)
            }
            uau.pedometer.queryPedometerData(from: Date().dayBefore3, to: Date().dayBefore2) { (data, error) in
                uau.tre = Int(truncating: data!.numberOfSteps)
            }
            uau.pedometer.queryPedometerData(from: Date().dayBefore4, to: Date().dayBefore3) { (data, error) in
                uau.quattro = Int(truncating: data!.numberOfSteps)
            }
            uau.pedometer.queryPedometerData(from: Date().dayBefore5, to: Date().dayBefore4) { (data, error) in
                uau.cinque = Int(truncating: data!.numberOfSteps)
            }
                                uau.pedometer.queryPedometerData(from: Date().dayBefore6, to: Date().dayBefore5) { (data, error) in
                                    uau.sei = Int(truncating: data!.numberOfSteps)
            }
           
        }
            
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
