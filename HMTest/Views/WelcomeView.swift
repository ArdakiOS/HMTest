//
//  WelcomeView.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var percentage: CGFloat = 25
    var body: some View {
        ZStack{
            if percentage == 100{
                NavigationPage()
            }
            else{
                Image("BG")
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                CustomProgressView(percentage: $percentage)
            }
        }
        
    }
}

#Preview {
    WelcomeView()
}
