//
//  NavigationTabBar.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

enum MyTabs : String, CaseIterable{
    case Trade = "Trade"
    case Top = "Top"
}

struct NavigationTabBar: View {
    @Binding var selectedTab : MyTabs
    var body: some View {
        HStack{
            ForEach(MyTabs.allCases, id: \.self){tab in
                if selectedTab == tab{
                    VStack{
                        Image("\(tab.rawValue + "Pressed")")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        Text(tab.rawValue)
                            .font(.custom("NunitoSans-Regular", size: 10))
                            .foregroundStyle(.green)
                    }
                    .frame(width: 175.5, height: 38, alignment: .center)
                        
                }
                else{
                    VStack {
                        Image(tab.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                withAnimation(.linear){
                                    selectedTab = tab
                                }
                            }
                        
                        Text(tab.rawValue)
                            .font(.custom("NunitoSans-Regular", size: 10))
                            .foregroundStyle(.gray)
                    }
                    .frame(width: 175.5, height: 38, alignment: .center)
                }
            }
        }
        .padding(.bottom)
        .frame(width: 375, height: 96)
        .frame(maxWidth: .infinity)
        .background(
            Color.init(red: 46/255, green: 50/255, blue: 65/255)
        )
        
    }
}
