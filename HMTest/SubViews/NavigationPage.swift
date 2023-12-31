//
//  NavigationPage.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct NavigationPage: View {
    @State var selectedTab = MyTabs.Trade
    
    let center = UNUserNotificationCenter.current()
        
        init() {
            center.requestAuthorization(options: [.sound , .alert , .badge ], completionHandler: { (granted, error) in
                if let error = error {
                    // Handle the error here.
                }
                // Enable or disable features based on the authorization.
            })
        }
    var body: some View {
        NavigationStack {
            VStack(spacing: 0){
                TabView(selection: $selectedTab){
                    Trade()
                        .tag(MyTabs.Trade)
                    
                    Top()
                        .tag(MyTabs.Top)
                }
                
                NavigationTabBar(selectedTab: $selectedTab)
            }
            .background(
                Color.init(red: 32/255, green: 35/255, blue: 47/255)
        )
        }
    }
}

#Preview {
    NavigationPage()
}
