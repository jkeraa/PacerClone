//
//  TabBarUpView.swift
//  Pacer
//
//  Created by Jacques André Kerambrun on 21/11/22.
//

import SwiftUI

struct TabBarUpView: View {
    var body: some View {
        TabView() {
            
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

struct TabBarUpView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUpView()
    }
}
