//
//  PedometerManager.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 18/11/22.
//

import Foundation
import CoreMotion
let defaults = UserDefaults.standard

class PedometerManager : ObservableObject {
    var activityManager = CMMotionActivityManager()
    var pedometer = CMPedometer()
   
    
    @Published var x = -1
    @Published var z = -1
    
   
}
