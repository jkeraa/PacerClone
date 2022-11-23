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
    typealias CMPedometerHandler = (CMPedometerData?, Error?) -> Void
   
    @EnvironmentObject var uau: PedometerManager
   
    @State var x = -1
    
    @State var dailySteps: Int?
   // @State var dailySteps: Int = UserDefaults.standard.integer(forKey: "DAILY_STEPS")
    
      // @State var x = 0
   
    
    //var y = PedometerManager()
    var activityManager = CMMotionActivityManager()
    var pedometer = CMPedometer()
    @State var segmentationSelection : ProfileSection = .tweets
    
    
    var body: some View {

       
        
        VStack (alignment: .center, spacing: 200, content:  {
     
            VStack (alignment: .leading, spacing: 10, content:  {
                
                Spacer()
                Spacer()
                
                Spacer()
              
             
                Spacer()
                
                Picker("", selection: $segmentationSelection) {
                            ForEach(ProfileSection.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding()
                
                HStack (alignment: .center, spacing: 100, content:  {
                    Text("Calories")
                        .foregroundColor(Color.gray)
                    
                    Text("Activity Time")
                        .foregroundColor(Color.gray)
                    
                    Text("Km")
                        .foregroundColor(Color.gray)
                    
                })
                
                HStack (alignment: .center, spacing: 140, content: {
                    Text(String(Int(0.035 * Double(uau.x)) ) )
                        .foregroundColor(Color.orange)
                    
                    Text(String(x * 2))
                        .foregroundColor(Color.green)
                    
                    Text("2,1")
                        .foregroundColor(Color.blue)
                    
                }).background(Color(red: 242/255, green: 242/255, blue: 247/255, opacity: 1.0))
                
            })
            
            CircularProgressView().frame(width: 10, height: 10)
 
            HStack {
                Chart {
                    BarMark(
                        x: .value("Shape Type", 1),
                        y: .value("Total Count", 3)
                    )
                    BarMark(
                        x: .value("Shape Type", 2),
                        y: .value("Total Count", 5)
                    )
                    BarMark(
                        x: .value("Shape Type", 3),
                        y: .value("Total Count", 1)
                    )
                    BarMark(
                        x: .value("Shape Type", 9),
                        y: .value("Total Count", 1)
                    )
                }.frame(width: 250, height: 100)
            }
            Text("")
            
   
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
            
        }).background(Color(red: 242/255, green: 242/255, blue: 247/255, opacity: 0.8))
    }
    
}

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
    
    static var tomorrow:  Date { return Date().dayAfter }
       
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
