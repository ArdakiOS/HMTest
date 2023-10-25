//
//  CustomProgressView.swift
//  HMTest
//
//  Created by Ardak Tursunbayev on 23.10.2023.
//

import SwiftUI

struct CustomProgressView: View {
    @Binding var percentage : CGFloat
    let complete : CGFloat = 300
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        Capsule()
            .fill(Color.gray)
            .frame(width: complete, height: 24)
            .overlay(
                Capsule()
                    .fill(Color.green)
                    .frame(width: complete * percentage/100),
                alignment: .leading
            )
            .overlay(
                Text("\(Int(percentage))%")
                    .bold()
                    .foregroundColor(.white)
                    .bold()
            )
            .animation(.bouncy, value: percentage)
            .onReceive(timer, perform: { _ in
                if percentage<100{
                    if percentage>90{
                        
                        percentage += 100 - percentage
                    }
                    else{
                        percentage += CGFloat(Int.random(in: (0...10)))
                    }
                }
                
            })
    }
}

