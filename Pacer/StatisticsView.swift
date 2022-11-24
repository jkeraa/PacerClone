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
    @State var currentTab: String = "7 days"
    @State var average: Int = -1
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white.opacity(0.7), Color.white.opacity(0.8)],
                startPoint: .top, endPoint: .bottom)
            
                VStack{
                    
                    Picker("", selection: $currentTab) {
                        Text("7 days").tag("7 days")
                        Text("Week").tag("Week")
                        Text("Month").tag("Month")
                    }.pickerStyle(.segmented)
                    Text ("Average Steps: \(average)").font(.title).bold().foregroundColor(.gray)
                    HStack {
                        Chart {
                            BarMark(
                                x: .value("Giorno", "6 giorni fa"),
                                y: .value("Passi", uau.sei)
                              //  y: .value("Passi", 5)
                            )
                            BarMark(
                                x: .value("Giorno", "5 giorni fa"),
                                 y: .value("Passi", uau.cinque)
                              //  y: .value("Passi", 10)
                            )
                            BarMark(
                                x: .value("Giorno", "4 giorni fa"),
                                 y: .value("Passi", uau.quattro)
                               // y: .value("Passi", 15)
                            )
                            BarMark(
                                x: .value("Giorno", "3 giorni fa"),
                                  y: .value("Passi", uau.tre)
                                //y: .value("Passi", 29)
                            )
                            BarMark(
                                x: .value("Giorno", "2 giorni fa"),
                                 y: .value("Passi", uau.due)
                               // y: .value("Passi", 48)
                            )
                            BarMark(
                                x: .value("Giorno", "ieri"),
                                y: .value("Passi", uau.uno)
                               // y: .value("Passi", 80)
                            )
                            BarMark(
                                x: .value("Giorno", "oggi"),
                                y: .value("Passi", uau.x)
                                //y: .value("Passi", 120)
                            )
                            
                        }
                    }.frame(height: 250)
                        .foregroundStyle(LinearGradient(
                            colors: [Color.blue, Color.cyan],
                            startPoint: .top, endPoint: .bottom))
     
                }.padding()
                    .background {
                        RoundedRectangle( cornerSize: CGSize(width: 20, height: 20), style: .continuous).fill(.white.shadow(.drop(radius: 100)))
                        
                        
                    }
            } .onAppear {
                average = (uau.x + uau.uno + uau.due + uau.tre + uau.quattro + uau.cinque + uau.sei) / 2
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


/*
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
 /**/*/
