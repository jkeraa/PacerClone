//
//  PedometerView.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 17/11/22.
//

import SwiftUI
import CoreMotion
import Charts



struct PedometerView: View {
    // @State var dailySteps: Int = UserDefaults.standard.integer(forKey: "DAILY_STEPS")
       // @State var x = 0
     //var y = PedometerManager()
   
    @EnvironmentObject var uau: PedometerManager
    @State var x = -1
    @State var dailySteps: Int?
   
    var activityManager = CMMotionActivityManager()
    var pedometer = CMPedometer()
     
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [Color.white.opacity(0.7), Color.white.opacity(0.8)],
                startPoint: .top, endPoint: .bottom)
            VStack (alignment: .center, spacing: 140, content:  {
                //spazio tutta applicazione
                
                
                VStack (alignment: .center, spacing: 50, content:  {
                    HStack {
                        //Spazio tra calorie e cerchio
                        Text("Daily Target: ").bold().font(.title2)
                        Text("10.000").bold().font(.title2)
                            .foregroundStyle(LinearGradient(
                                colors: [Color.blue, Color.cyan],
                                startPoint: .top, endPoint: .bottom))
                        Text("Steps ").bold().font(.title2)
                    }
                    VStack (alignment: .center, spacing: 5, content:  {
                        //Spazio tra calorie e dati
                        
                        
                        HStack (alignment: .center, spacing: 40, content:  {
                            
                            Text("Calories").font ( .title2)
                                .foregroundColor(Color.black).opacity(0.8)
                                .bold()
                            
                            Text("Activity Time").font ( .title2)
                                .foregroundColor(Color.black).opacity(0.8)
                                .bold()
                            
                            Text("Km").font( .title2)
                                .foregroundColor(Color.black).opacity(0.8)
                                .bold()
                            
                        }) //FINE HSTACK
                        
                        HStack (alignment: .center, spacing: 130, content: {
                            Text(String(Int(0.035 * Double(uau.x)) ) )
                           // Text("99")
                                .foregroundStyle(LinearGradient(
                                    colors: [Color.blue, Color.cyan],
                                    startPoint: .top, endPoint: .bottom))
                                .bold()
                            Text("\((uau.x * 6) / 3600)h")
                            //Text("99")
                            
                                .foregroundStyle(LinearGradient(
                                    colors: [Color.blue, Color.cyan],
                                    startPoint: .top, endPoint: .bottom))
                                .bold()
                            Text("\(Int(Double(uau.x) * 0.60))")
                                .foregroundStyle(LinearGradient(
                                    colors: [Color.blue, Color.cyan],
                                    startPoint: .top, endPoint: .bottom))
                                .bold()
                        }) //FINE HSTACK
                        
                    }).multilineTextAlignment(.center)
                    
                        .frame(width: 355, height: 40)
                        .padding()
                        .background(RoundedRectangle(cornerSize: CGSize(width: 200, height: 200)).fill(Color.white.opacity(0.8)).shadow(radius: 3)) //FINE VSTACK
                    
                }) //FINE VSTACK
                
                CircularProgressView().frame(width: 10, height: 10)
                    
                
                 //FINE HSTACK
                
                HStack {
                    Chart {
                        BarMark(
                            x: .value("Shape Type", "08:00"),
                            y: .value("Total Count", 10)
                        )
                        BarMark(
                            x: .value("Shape Type", "10:00"),
                            y: .value("Total Count", 40)
                        )
                        BarMark(
                            x: .value("Shape Type", "14:00"),
                            y: .value("Total Count", 80)
                        )
                        BarMark(
                            x: .value("Shape Type", "18:00"),
                            y: .value("Total Count", 30)
                        )
                        BarMark(
                            x: .value("Shape Type", "22:00"),
                            y: .value("Total Count", 90)
                        )
                        BarMark(
                            x: .value("Shape Type", "00:00"),
                            y: .value("Total Count", 10)
                        )
                        
                    }.frame(width: 250, height: 100)
                        .foregroundStyle(LinearGradient(
                            colors: [Color.blue, Color.cyan],
                            startPoint: .top, endPoint: .bottom))
                        .padding()
                        .background(Rectangle().fill(Color.white.opacity(1.9)).shadow(radius: 10))
                    
                }//FINE HSTACK
                
            }) //FINE VSTACK INIZIALE
            
            .onAppear{
                
                if CMMotionActivityManager.isActivityAvailable(){
                    uau.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in DispatchQueue.main.async {
                        if let activity = data {
                            if activity.running == true {
                                print("running")
                            } else if activity.walking == true {
                                print("walking")
                            } else if activity.automotive == true {
                                print("automotive")
                            } else if activity.stationary == true {
                                print("automotive")
                            }
                        }
                    }
                        
                        if CMPedometer.isStepCountingAvailable(){
                            uau.pedometer.startUpdates(from: Date().mattina) { (data,error) in
                                if error == nil {
                                    if let response = data {
                                        DispatchQueue.main.async {
                                            uau.x = Int(response.numberOfSteps)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
    } //FINE SOME VIEW
} //FINE VIEW

struct PedometerView_Previews: PreviewProvider {
    static var previews: some View {
        PedometerView()
    }
}



extension Date {
   
    var mattina: Date {
        return Calendar.current.startOfDay(for: Date())
    }
    
    static var yesterday: Date { return Date().dayBefore }

       
    var dayBefore: Date {
           return Calendar.current.date(byAdding: .day, value: -1, to: mattina)!
       }
    var dayBefore2: Date {
           return Calendar.current.date(byAdding: .day, value: -2, to: mattina)!
       }
    var dayBefore3: Date {
           return Calendar.current.date(byAdding: .day, value: -3, to: mattina)!
       }
    var dayBefore4: Date {
           return Calendar.current.date(byAdding: .day, value: -4, to: mattina)!
       }
    var dayBefore5: Date {
           return Calendar.current.date(byAdding: .day, value: -5, to: mattina)!
       }
    var dayBefore6: Date {
           return Calendar.current.date(byAdding: .day, value: -6, to: mattina)!
       }
       var dayAfter: Date {
           return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
       }
       var noon: Date {
           return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
       }
   
       var month: Int {
           return Calendar.current.component(.month,  from: self)
       }
    
       var isLastDayOfMonth: Bool {
           return dayAfter.month != month
       }
  
}

func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}
