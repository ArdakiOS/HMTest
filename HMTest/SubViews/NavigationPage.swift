//
//  NavigationPage.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct NavigationPage: View {
    @State var selectedTab = MyTabs.Top
    var body: some View {
        VStack{
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

#Preview {
    NavigationPage()
}