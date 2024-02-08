//
//  MainTabView.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab, content:  {
            Text("Time converter")
                .tabItem { Image(systemName: "clock.arrow.2.circlepath")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("Volume converter")
                .tabItem { Image(systemName: "testtube.2")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            Text("Length converter")
                .tabItem { Image(systemName: selectedTab == 3 ? "ruler.fill" : "ruler")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            Text("Temperature converter")
                .tabItem { Image(systemName: selectedTab == 4 ? "thermometer.sun.fill" : "thermometer.sun")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        })
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
