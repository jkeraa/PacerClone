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
                        x: .value("Orario", 1),
                        y: .value("Passi", uau.z)
                    )
                    BarMark(
                        x: .value("orario", 2),
                        y: .value("Passi", uau.x)
                    )
                    BarMark(
                        x: .value("Orario", 3),
                        y: .value("Passi", 12000)
                    )
                    BarMark(
                        x: .value("Orario", 4),
                        y: .value("Passi", 9000)
                    )
                }
            }
            HStack {
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    print(uau.x)
                    
                    
                }
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                }
            }
            
        }
    }


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
