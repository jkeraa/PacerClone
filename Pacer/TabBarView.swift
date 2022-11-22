//
//  TabBarView.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 17/11/22.
//

import SwiftUI




struct TabBarView: View {
    @State private var selection = 2
    
    var body: some View {
        
        
          TabView(selection:$selection) {
              
            StatisticsView().tabItem {
                Image(systemName: "chart.bar.xaxis")
                Text("Statistics") }.tag(1)
              
              PedometerView().tabItem { Image(systemName: "figure.walk")
                  Text("Steps")}.tag(2)
              
            Text("Tab Content 3").tabItem {
                Image(systemName: "list.dash.header.rectangle")
                Text("Feed") }.tag(3)
                  .background(Color(red: 242/255, green: 242/255, blue: 247/255, opacity: 1.0))
            
          }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
